import 'dart:async';
import 'dart:js' as js;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/firebase_service.dart';
import '../models/prezentare_state.dart';
import '../slides/slide_00.dart';
import '../slides/slide_01.dart';
import '../slides/slide_02.dart';
import '../slides/slide_03.dart';
import '../slides/slide_04.dart';
import '../slides/slide_07.dart';
import '../slides/slide_08.dart';
import '../slides/slide_09.dart';
import '../slides/slide_10.dart';
import '../slides/slide_11.dart';
import '../slides/slide_12.dart';
import '../slides/slide_13.dart';
import '../slides/slide_14.dart';
import '../slides/slide_15.dart';
import '../slides/slide_16.dart';
import '../slides/qr.dart';


class PresentationPage extends StatefulWidget {
  const PresentationPage({super.key});

  @override
  State<PresentationPage> createState() => _PresentationPageState();
}

class _PresentationPageState extends State<PresentationPage> {
  final _fb = FirebaseService();
  PrezentareState _state = const PrezentareState();
  bool _showControls = false;
  int _previousIndex = 0;

  StreamSubscription<PrezentareState>? _stateSub;
  final FocusNode _keyboardFocus = FocusNode();

  List<Widget> get _slides => [
    const Slide00Intro(),            // 0  – Titlu / copertă
    const Slide01WhatIsApp(),        // 1  – Ce este o aplicație
    const Slide02Revenue(),          // 2  – Venituri globale
    Slide03History(),          // 3  – Istoric
    const Slide04Milestones(),       // 4  – Momente cheie
    Slide05TipuriAppWeb(),     // 7  – Aplicații Web
    Slide06TipuriAppMobile(),  // 8  – Aplicații Mobile
    Slide07DesktopGaming(),    // 9  – Desktop & Gaming
    Slide08BackendSecurity(),
    Slide09CerinteSRS(),
    Slide10DesignSystem(),         // 12 – Design UI/UX: Principii & Navigație
    Slide11DesignUX(),     // 13 – Design System, Accesibilitate & Motion
    Slide12Arhitectura(),      // 14 – Arhitectura & Baze de Date
    Slide13Securitate(),       // 15 – Securitatea: STRIDE & OWASP
    Slide14AIConcluzie(),      // 16 – AI & Concluzie
    SlideQrDemo(),             // 17 – QR Cod & Live Demo
  ];

  int get _safeIndex => _state.slideIndex.clamp(0, _slides.length - 1);

  // ── Web Audio API – sunet plăcut de tip "chime" ──────────────────────────
  void _playFuturisticSound({bool forward = true}) {
    try {
      final script = '''
(function() {
  try {
    var ctx = new (window.AudioContext || window.webkitAudioContext)();
    // Resume necesar pe Chrome/Safari/mobile după prima interacțiune
    if (ctx.state === 'suspended') ctx.resume();

    var master = ctx.createGain();
    master.gain.value = 0.18;
    master.connect(ctx.destination);

    var now = ctx.currentTime;
    var fwd = ${forward ? 'true' : 'false'};

    // Trei sinusoide – un acord de cvintă + octavă (sunet curat, plăcut)
    var freqs = fwd ? [523.25, 783.99, 1046.50]   // Do5 – Sol5 – Do6  (urcă)
                    : [1046.50, 783.99, 523.25];    // Do6 – Sol5 – Do5  (coboară)

    freqs.forEach(function(startF, i) {
      var endF = fwd ? startF * 1.04 : startF * 0.96;  // glide mic, nu dramatic
      var delay = i * 0.045;                            // arpeggio scurt

      var osc  = ctx.createOscillator();
      var env  = ctx.createGain();

      osc.type = 'sine';
      osc.frequency.setValueAtTime(startF, now + delay);
      osc.frequency.linearRampToValueAtTime(endF, now + delay + 0.25);

      // Envelope: attack rapid, decay lin, silence
      env.gain.setValueAtTime(0, now + delay);
      env.gain.linearRampToValueAtTime(1.0, now + delay + 0.02);
      env.gain.setValueAtTime(1.0,  now + delay + 0.02);
      env.gain.exponentialRampToValueAtTime(0.001, now + delay + 0.38);

      osc.connect(env);
      env.connect(master);
      osc.start(now + delay);
      osc.stop(now + delay + 0.40);
    });

    // Sub-ton moale – dă "greutate" fără să sune a efect de joc
    var sub  = ctx.createOscillator();
    var subG = ctx.createGain();
    sub.type = 'sine';
    sub.frequency.value = fwd ? 261.63 : 130.81;   // Do4 / Do3
    subG.gain.setValueAtTime(0, now);
    subG.gain.linearRampToValueAtTime(0.55, now + 0.02);
    subG.gain.exponentialRampToValueAtTime(0.001, now + 0.22);
    sub.connect(subG);
    subG.connect(master);
    sub.start(now);
    sub.stop(now + 0.24);
  } catch(e) {}
})();
''';
      js.context.callMethod('eval', [script]);
    } catch (_) {}
  }

  void _goToSlide(int index) {
    final bool goingForward = index > _previousIndex;
    _playFuturisticSound(forward: goingForward);
    _previousIndex = index;
    _fb.setSlide(index);
  }

  @override
  void initState() {
    super.initState();
    html.document.documentElement?.requestFullscreen();
    _stateSub = _fb.stateStream.listen((s) {
      if (mounted) {
        final newIndex = s.slideIndex.clamp(0, _slides.length - 1);
        if (newIndex != _previousIndex) {
          _playFuturisticSound(forward: newIndex > _previousIndex);
          _previousIndex = newIndex;
        }
        setState(() => _state = s);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback(
            (_) => _keyboardFocus.requestFocus());
  }

  @override
  void dispose() {
    html.document.exitFullscreen();
    _stateSub?.cancel();
    _keyboardFocus.dispose();
    super.dispose();
  }

  void _toggleControls() => setState(() => _showControls = !_showControls);

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _keyboardFocus,
      onKeyEvent: (event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowRight ||
              event.logicalKey == LogicalKeyboardKey.space) {
            _goToSlide(_safeIndex + 1);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _goToSlide(_safeIndex > 0 ? _safeIndex - 1 : 0);
          } else if (event.logicalKey == LogicalKeyboardKey.escape) {
            Navigator.pushReplacementNamed(context, '/');
          }
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF040810),
        body: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: SizedBox.expand(
                key: ValueKey(_safeIndex),
                child: _slides[_safeIndex],
              ),
            ),

            Positioned.fill(
              child: GestureDetector(
                onTap: _toggleControls,
                behavior: HitTestBehavior.translucent,
                child: const SizedBox.expand(),
              ),
            ),

            Positioned(
              top: 0, left: 0, right: 0,
              child: AnimatedOpacity(
                opacity: _showControls ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: IgnorePointer(
                  ignoring: !_showControls,
                  child: _buildControlBar(),
                ),
              ),
            ),

            Positioned(
              bottom: 14, left: 0, right: 0,
              child: _buildSlideIndicators(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlideIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_slides.length, (i) {
        final active = i == _safeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 22 : 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: active
                ? const Color(0xFF00F0FF)
                : const Color(0xFF00F0FF).withOpacity(0.22),
          ),
        );
      }),
    );
  }

  Widget _buildControlBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.80),
        border: const Border(
          bottom: BorderSide(color: Color(0xFF00F0FF), width: 1),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            icon: const Icon(Icons.arrow_back, color: Color(0xFF00F0FF)),
            tooltip: 'Înapoi la meniu',
          ),
          const SizedBox(width: 8),
          Text(
            '${_safeIndex + 1} / ${_slides.length}',
            style: const TextStyle(
              color: Color(0xFF00F0FF),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () =>
                _goToSlide(_safeIndex > 0 ? _safeIndex - 1 : 0),
            icon: const Icon(Icons.chevron_left, color: Colors.white),
            iconSize: 32,
          ),
          IconButton(
            onPressed: () => _goToSlide(_safeIndex + 1),
            icon: const Icon(Icons.chevron_right, color: Colors.white),
            iconSize: 32,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _state.actiune.isNotEmpty
                  ? const Color(0xFF00FF88).withOpacity(0.12)
                  : Colors.grey.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _state.actiune.isNotEmpty
                    ? const Color(0xFF00FF88).withOpacity(0.4)
                    : Colors.grey.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.phone_android,
                  color: _state.actiune.isNotEmpty
                      ? const Color(0xFF00FF88)
                      : Colors.grey,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  _state.actiune.isNotEmpty
                      ? 'Android: ${_state.actiune}'
                      : 'Android: aștept...',
                  style: TextStyle(
                    color: _state.actiune.isNotEmpty
                        ? const Color(0xFF00FF88)
                        : Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}