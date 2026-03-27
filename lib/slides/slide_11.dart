// ignore_for_file: avoid_web_libraries_in_flutter
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:html' as html;

// ─────────────────────────────────────────────────────────────────────────────
// Slide 09 – Cerințe & Specificații SRS
// Un singur fișier · split 50/50 · animație hi-tech fundal
// ─────────────────────────────────────────────────────────────────────────────

class Slide09CerinteSRS extends StatefulWidget {
  const Slide09CerinteSRS({super.key});

  @override
  State<Slide09CerinteSRS> createState() => _Slide09State();
}

class _Slide09State extends State<Slide09CerinteSRS>
    with TickerProviderStateMixin {
  late AnimationController _glowCtrl;
  late AnimationController _bgCtrl;

  static bool _iframeRegistered = false;
  static const _viewType = 'google-doc-embed-09';
  static const _docUrl =
      'https://docs.google.com/document/d/10wd4pPviAIScjt8ylVBZKsXU_iUAC5CLLvHWCW6RW7E/preview';

  @override
  void initState() {
    super.initState();
    _glowCtrl =
    AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat();
    _bgCtrl =
    AnimationController(vsync: this, duration: const Duration(seconds: 20))
      ..repeat();

    if (!_iframeRegistered) {
      _iframeRegistered = true;
      try {
        ui_web.platformViewRegistry.registerViewFactory(_viewType, (int id) {
          return html.IFrameElement()
            ..src = _docUrl
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%'
            ..setAttribute('allowfullscreen', 'true')
            ..setAttribute('loading', 'lazy');
        });
      } catch (_) {}
    }
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    _bgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_09'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF010508), Color(0xFF050A12), Color(0xFF020C10)],
        ),
      ),
      child: Stack(children: [
        // ── Animație hi-tech fundal ──────────────────────────────────────
        AnimatedBuilder(
          animation: _bgCtrl,
          builder: (_, __) => CustomPaint(
            painter: _HiTechBgPainter(progress: _bgCtrl.value),
            size: Size.infinite,
          ),
        ),

        // ── Glow orbs ────────────────────────────────────────────────────
        AnimatedBuilder(
          animation: _glowCtrl,
          builder: (_, __) {
            final p = 0.5 + 0.5 * math.sin(_glowCtrl.value * 2 * math.pi);
            return Stack(children: [
              Positioned(
                top: -160, right: -100,
                child: _GlowOrb(size: 560, color: const Color(0xFF00F0FF), opacity: 0.08 + 0.04 * p),
              ),
              Positioned(
                bottom: -120, left: 20,
                child: _GlowOrb(size: 440, color: const Color(0xFF00FF88), opacity: 0.06 + 0.03 * p),
              ),
              Positioned(
                top: 100, left: -80,
                child: _GlowOrb(size: 300, color: const Color(0xFF7B4FFF), opacity: 0.05 + 0.02 * p),
              ),
            ]);
          },
        ),

        // ── Conținut ─────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(72, 40, 72, 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Header(glowCtrl: _glowCtrl),
              const SizedBox(height: 28),
              Expanded(
                child: _SplitBox(glowCtrl: _glowCtrl, viewType: _viewType)
                    .animate()
                    .fadeIn(duration: 700.ms, delay: 300.ms),
              ),
            ],
          ),
        ),

        // ── Linie neon stânga ────────────────────────────────────────────
        Positioned(
          left: 0, top: 0, bottom: 0,
          child: AnimatedBuilder(
            animation: _glowCtrl,
            builder: (_, __) => Container(
              width: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF00F0FF).withOpacity(0),
                    const Color(0xFF00F0FF)
                        .withOpacity(0.75 + 0.25 * math.sin(_glowCtrl.value * 2 * math.pi)),
                    const Color(0xFF00FF88).withOpacity(0.65),
                    const Color(0xFF00F0FF).withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hi-Tech Background Painter
// ─────────────────────────────────────────────────────────────────────────────

class _HiTechBgPainter extends CustomPainter {
  final double progress;
  _HiTechBgPainter({required this.progress});

  static final _rng = math.Random(42);
  static final List<_Particle> _particles = List.generate(
    55,
        (i) => _Particle(
      x: _rng.nextDouble(),
      y: _rng.nextDouble(),
      speed: 0.004 + _rng.nextDouble() * 0.012,
      radius: 1.0 + _rng.nextDouble() * 2.0,
      phase: _rng.nextDouble() * 2 * math.pi,
    ),
  );

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Hex grid
    final hexPaint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.028)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;
    const hexR = 44.0;
    final hexH = hexR * math.sqrt(3);
    final cols = (size.width / (hexR * 1.5)).ceil() + 2;
    final rows = (size.height / hexH).ceil() + 2;
    for (int col = -1; col < cols; col++) {
      for (int row = -1; row < rows; row++) {
        final cx = col * hexR * 1.5;
        final cy = row * hexH + (col.isOdd ? hexH / 2 : 0);
        _drawHex(canvas, hexPaint, Offset(cx, cy), hexR);
      }
    }

    // 2. Linii circuit subțiri
    final circPaint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.04)
      ..strokeWidth = 0.5;
    for (int i = 0; i < 6; i++) {
      final y = size.height * (i + 1) / 7;
      canvas.drawLine(Offset(0, y), Offset(size.width * 0.45, y), circPaint);
    }
    for (int i = 0; i < 4; i++) {
      final x = size.width * (i + 1) / 5;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height * 0.3), circPaint);
    }

    // 3. Scan line
    final scanY = size.height * ((progress * 1.3) % 1.0);
    final scanPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF00F0FF).withOpacity(0),
          const Color(0xFF00F0FF).withOpacity(0.16),
          const Color(0xFF00F0FF).withOpacity(0.30),
          const Color(0xFF00F0FF).withOpacity(0.16),
          const Color(0xFF00F0FF).withOpacity(0),
        ],
        stops: const [0, 0.3, 0.5, 0.7, 1],
      ).createShader(Rect.fromLTWH(0, scanY - 32, size.width, 64));
    canvas.drawRect(Rect.fromLTWH(0, scanY - 32, size.width, 64), scanPaint);

    // 4. Particule
    for (final p in _particles) {
      final t = (progress + p.phase / (2 * math.pi)) % 1.0;
      final px = (p.x + math.sin(t * 2 * math.pi * 0.7 + p.phase) * 0.04).clamp(0.0, 1.0);
      final py = (p.y - p.speed * progress * 20) % 1.0;
      final opacity = 0.22 + 0.45 * math.sin(t * math.pi);
      canvas.drawCircle(
        Offset(px * size.width, py * size.height),
        p.radius,
        Paint()..color = const Color(0xFF00F0FF).withOpacity(opacity),
      );
      canvas.drawLine(
        Offset(px * size.width, py * size.height),
        Offset(px * size.width, (py + 0.015) * size.height),
        Paint()
          ..color = const Color(0xFF00FF88).withOpacity(opacity * 0.35)
          ..strokeWidth = p.radius * 0.7,
      );
    }

    // 5. Corner brackets
    final bp = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.18)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    const bl = 28.0;
    const bm = 16.0;
    canvas.drawPath(Path()..moveTo(bm, bm + bl)..lineTo(bm, bm)..lineTo(bm + bl, bm), bp);
    canvas.drawPath(Path()..moveTo(size.width - bm - bl, bm)..lineTo(size.width - bm, bm)..lineTo(size.width - bm, bm + bl), bp);
    canvas.drawPath(Path()..moveTo(bm, size.height - bm - bl)..lineTo(bm, size.height - bm)..lineTo(bm + bl, size.height - bm), bp);
    canvas.drawPath(Path()..moveTo(size.width - bm - bl, size.height - bm)..lineTo(size.width - bm, size.height - bm)..lineTo(size.width - bm, size.height - bm - bl), bp);

    // 6. Data stream dreapta
    for (int i = 0; i < 14; i++) {
      final segY = (i / 14.0 + progress * 0.6) % 1.0 * size.height * 0.55 + size.height * 0.05;
      final segLen = 12.0 + math.sin(i * 1.7 + progress * 5) * 8;
      canvas.drawLine(
        Offset(size.width * 0.88, segY),
        Offset(size.width * 0.88, segY + segLen),
        Paint()
          ..color = const Color(0xFF00FF88).withOpacity(0.08 + 0.10 * math.sin(i * 0.8 + progress * 4))
          ..strokeWidth = 1.0,
      );
    }
  }

  void _drawHex(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = math.pi / 180 * (60 * i - 30);
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0) path.moveTo(x, y);
      else path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HiTechBgPainter old) => old.progress != progress;
}

class _Particle {
  final double x, y, speed, radius, phase;
  const _Particle({required this.x, required this.y, required this.speed, required this.radius, required this.phase});
}

// ─────────────────────────────────────────────────────────────────────────────
// Header
// ─────────────────────────────────────────────────────────────────────────────

class _Header extends StatelessWidget {
  final AnimationController glowCtrl;
  const _Header({required this.glowCtrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Text('09',
                  style: TextStyle(color: Color(0xFF00F0FF), fontSize: 18, fontWeight: FontWeight.w800, letterSpacing: 4)),
              const SizedBox(width: 10),
              Container(width: 1, height: 18, color: const Color(0xFF00F0FF).withOpacity(0.4)),
              const SizedBox(width: 10),
              Text('INGINERIE SOFTWARE · 2026',
                  style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 16, letterSpacing: 3)),
            ]).animate().fadeIn(duration: 500.ms),
            const SizedBox(height: 14),
            ShaderMask(
              shaderCallback: (b) =>
                  const LinearGradient(colors: [Colors.white, Color(0xFF90D8FF)]).createShader(b),
              child: const Text('Cerințe &\nSpecificații SRS',
                  style: TextStyle(color: Colors.white, fontSize: 64, fontWeight: FontWeight.w900, height: 1.05, letterSpacing: -1.0)),
            )
                .animate()
                .fadeIn(duration: 800.ms, delay: 200.ms)
                .slideY(begin: 0.08, end: 0, duration: 700.ms, delay: 200.ms),
          ],
        ),
        Row(children: [
          _KpiChip(value: '2', label: 'Etape\ncheie', color: const Color(0xFF00F0FF))
              .animate().fadeIn(duration: 600.ms, delay: 400.ms),
          const SizedBox(width: 14),
          _KpiChip(value: '5', label: 'Secțiuni\nSRS', color: const Color(0xFF00FF88))
              .animate().fadeIn(duration: 600.ms, delay: 550.ms),
          const SizedBox(width: 14),
          _KpiChip(value: 'IEEE', label: 'Standard\n29148', color: const Color(0xFFFFCC00))
              .animate().fadeIn(duration: 600.ms, delay: 700.ms),
        ]),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Split box 50 / 50
// ─────────────────────────────────────────────────────────────────────────────

class _SplitBox extends StatefulWidget {
  final AnimationController glowCtrl;
  final String viewType;
  const _SplitBox({required this.glowCtrl, required this.viewType});

  @override
  State<_SplitBox> createState() => _SplitBoxState();
}

class _SplitBoxState extends State<_SplitBox> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedBuilder(
        animation: widget.glowCtrl,
        builder: (_, child) {
          final p = 0.5 + 0.5 * math.sin(widget.glowCtrl.value * 2 * math.pi);
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _hovered
                    ? const Color(0xFF00F0FF).withOpacity(0.60 + 0.15 * p)
                    : const Color(0xFF00F0FF).withOpacity(0.22 + 0.08 * p),
                width: _hovered ? 1.8 : 1.2,
              ),
              color: const Color(0xFF020810).withOpacity(0.88),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF00F0FF).withOpacity(_hovered ? 0.12 + 0.04 * p : 0.04),
                  blurRadius: _hovered ? 40 : 20,
                  spreadRadius: _hovered ? 4 : 1,
                ),
              ],
            ),
            child: child,
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Row(children: [
            // stânga (Design compact, fără scroll)
            const Expanded(child: _LeftPanel()),
            // separator neon
            AnimatedBuilder(
              animation: widget.glowCtrl,
              builder: (_, __) {
                final p = 0.5 + 0.5 * math.sin(widget.glowCtrl.value * 2 * math.pi);
                return Container(
                  width: 1.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF00F0FF).withOpacity(0),
                        const Color(0xFF00F0FF).withOpacity(0.5 + 0.2 * p),
                        const Color(0xFF00FF88).withOpacity(0.4 + 0.15 * p),
                        const Color(0xFF00F0FF).withOpacity(0),
                      ],
                    ),
                  ),
                );
              },
            ),
            // dreapta
            Expanded(child: _RightPanel(viewType: widget.viewType)),
          ]),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Panoul stânga — Etapa 1 (Compact Layout)
// ─────────────────────────────────────────────────────────────────────────────

class _LeftPanel extends StatelessWidget {
  const _LeftPanel();

  static const List<List<dynamic>> _nfRows = [
    ['Performanță', 'Răspuns <200ms la 95% cereri. 10.000 utilizatori.', Color(0xFF00F0FF)],
    ['Disponibil.', 'Uptime 99.9% (max ~8h downtime/an). Plan DR.', Color(0xFF00FF88)],
    ['Scalabilitate', 'Creștere orizontală fără refactorizări majore.', Color(0xFFFFCC00)],
    ['Mentenabil.', 'Teste min. 80%. Documentație API automată.', Color(0xFFFF6E88)],
    ['Conformitate', 'GDPR, ISO 27001, PCI-DSS. Audit trail vizibil.', Color(0xFFB88BFF)],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Padding redus pentru a se încadra optim în ecran
      padding: const EdgeInsets.fromLTRB(28, 20, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFF00F0FF).withOpacity(0.4)),
              color: const Color(0xFF00F0FF).withOpacity(0.07),
            ),
            child: const Text('ETAPA 1',
                style: TextStyle(color: Color(0xFF00F0FF), fontSize: 10, fontWeight: FontWeight.w800, letterSpacing: 2)),
          ),
          const SizedBox(height: 12),

          // titlu
          ShaderMask(
            shaderCallback: (b) =>
                const LinearGradient(colors: [Colors.white, Color(0xFF90D8FF)]).createShader(b),
            child: const Text('Definirea Ideii și a Scopului',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: -0.5)),
          ),
          const SizedBox(height: 10),

          _Para('Orice aplicație de succes pornește de la o idee clară. Cerințele software sunt contractul dintre beneficiari și echipa de dezvoltare, calitatea lor determinând succesul produsului.'),

          const SizedBox(height: 16),

          _SecTitle(number: '1', title: 'Cerințe Funcționale', color: const Color(0xFF00F0FF)),
          const SizedBox(height: 8),
          _Para('Descriu comportamentele concrete ale sistemului (ex: User Story):'),
          const SizedBox(height: 6),

          // quote user story
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF00F0FF).withOpacity(0.25)),
              color: const Color(0xFF00F0FF).withOpacity(0.05),
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: 3, height: 34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: const Color(0xFF00F0FF).withOpacity(0.6)),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  '„Ca [tip de utilizator], vreau să [acțiune], astfel încât [beneficiu obținut]"',
                  style: TextStyle(color: Color(0xFFB8E0FF), fontSize: 11, fontStyle: FontStyle.italic, height: 1.4),
                ),
              ),
            ]),
          ),
          const SizedBox(height: 8),

          // highlight box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.3)),
              color: const Color(0xFF00FF88).withOpacity(0.05),
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('EXEMPLU CRITERIU ACCEPTANȚĂ',
                  style: TextStyle(color: const Color(0xFF00FF88).withOpacity(0.7), fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
              const SizedBox(height: 4),
              Text(
                'Parolă: min. 8 caractere, literă mare, număr. Email de confirmare în max. 60 secunde.',
                style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 11, height: 1.4),
              ),
            ]),
          ),

          const SizedBox(height: 16),

          _SecTitle(number: '2', title: 'Cerințe Non-Funcționale', color: const Color(0xFF00FF88)),
          const SizedBox(height: 8),

          // tabel NF (Dimensiuni mai compacte)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF00F0FF).withOpacity(0.15)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                color: const Color(0xFF00F0FF).withOpacity(0.08),
                child: Row(children: [
                  Expanded(flex: 3, child: Text('CRITERIU', style: TextStyle(color: const Color(0xFF00F0FF).withOpacity(0.6), fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1))),
                  Expanded(flex: 5, child: Text('STANDARD MINIM', style: TextStyle(color: const Color(0xFF00F0FF).withOpacity(0.6), fontSize: 9, fontWeight: FontWeight.w800, letterSpacing: 1))),
                ]),
              ),
              for (int i = 0; i < _nfRows.length; i++)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: i.isEven ? Colors.transparent : const Color(0xFF00F0FF).withOpacity(0.025),
                    border: Border(top: BorderSide(color: const Color(0xFF00F0FF).withOpacity(0.08))),
                  ),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      flex: 3,
                      child: Row(children: [
                        Container(
                          width: 5, height: 5,
                          margin: const EdgeInsets.only(top: 4, right: 6),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: _nfRows[i][2] as Color),
                        ),
                        Expanded(
                          child: Text(_nfRows[i][0] as String,
                              style: TextStyle(color: _nfRows[i][2] as Color, fontSize: 10.5, fontWeight: FontWeight.w700)),
                        ),
                      ]),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(_nfRows[i][1] as String,
                          style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 10.5, height: 1.3)),
                    ),
                  ]),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Panoul dreapta — Google Docs iframe (Fără Header)
// ─────────────────────────────────────────────────────────────────────────────

class _RightPanel extends StatelessWidget {
  final String viewType;
  const _RightPanel({required this.viewType});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // iframe direct, care ocupă toată zona
      Positioned.fill(child: ClipRect(child: HtmlElementView(viewType: viewType))),

      // fade opțional la baza iFrame-ului (păstrat pentru continuitate de design)
      Positioned(bottom: 0, left: 0, right: 0,
          child: IgnorePointer(child: Container(height: 32,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  colors: [const Color(0xFF020810).withOpacity(0.9), Colors.transparent]))))),
    ]);
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Widgets mici reutilizabile
// ─────────────────────────────────────────────────────────────────────────────

class _Para extends StatelessWidget {
  final String text;
  const _Para(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: TextStyle(color: Colors.white.withOpacity(0.70), fontSize: 11, height: 1.5, letterSpacing: 0.1));
}

class _SecTitle extends StatelessWidget {
  final String number, title;
  final Color color;
  const _SecTitle({required this.number, required this.title, required this.color});
  @override
  Widget build(BuildContext context) => Row(children: [
    Container(
      width: 24, height: 24,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color.withOpacity(0.12), border: Border.all(color: color.withOpacity(0.5))),
      child: Center(child: Text(number, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w900))),
    ),
    const SizedBox(width: 8),
    Text(title, style: TextStyle(color: color, fontSize: 13, fontWeight: FontWeight.w800, letterSpacing: 0.3)),
  ]);
}

class _KpiChip extends StatelessWidget {
  final String value, label;
  final Color color;
  const _KpiChip({required this.value, required this.label, required this.color});
  @override
  Widget build(BuildContext context) => Container(
    width: 130,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.35)),
        color: color.withOpacity(0.07)),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(value, style: TextStyle(color: color, fontSize: 32, fontWeight: FontWeight.w900, height: 1)),
      const SizedBox(height: 4),
      Text(label, style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 13)),
    ]),
  );
}

class _GlowOrb extends StatelessWidget {
  final double size;
  final Color color;
  final double opacity;
  const _GlowOrb({required this.size, required this.color, required this.opacity});
  @override
  Widget build(BuildContext context) => Container(
    width: size, height: size,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color.withOpacity(opacity), Colors.transparent])),
  );
}