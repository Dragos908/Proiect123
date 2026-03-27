import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Slide05TipuriAppWeb extends StatefulWidget {
  const Slide05TipuriAppWeb({super.key});
  @override
  State<Slide05TipuriAppWeb> createState() => _Slide05State();
}

class _Slide05State extends State<Slide05TipuriAppWeb>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Color _accent = const Color(0xFF00F0FF);

  static const String _gifPath = 'assets/01.gif'; // ✅ CORECTAT

  final List<String> _languages = [
    'JavaScript — standard absolut pentru frontend, folosit și în backend',
    'TypeScript — varianta tipizată și mai structurată a JavaScript-ului',
    'PHP — foarte popular pentru backend (Laravel, WordPress)',
    'Python — folosit cu Django, Flask sau FastAPI',
    'Go — backend modern, rapid și eficient pentru API-uri',
    'Java — aplicații enterprise de mari dimensiuni',
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 10))
      ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_05'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter05(), size: Size.infinite),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _CircuitBoardPainter(_ctrl.value, _accent),
            size: Size.infinite,
          ),
        ),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _ScanBeamPainter(_ctrl.value, _accent),
            size: Size.infinite,
          ),
        ),
        Positioned(
          top: -100,
          right: -60,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                _accent.withOpacity(0.08),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: AnimatedBuilder(
            animation: _ctrl,
            builder: (_, __) => Container(
              width: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    _accent.withOpacity(0),
                    _accent.withOpacity(
                        0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi)),
                    Colors.white.withOpacity(0.5),
                    _accent.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 44, 40, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(width: 36, height: 3, color: _accent),
                const SizedBox(width: 12),
                Text('05',
                    style: TextStyle(
                      color: _accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4,
                    )),
                const SizedBox(width: 12),
                Container(
                    width: 1, height: 16, color: _accent.withOpacity(0.3)),
                const SizedBox(width: 12),
                Text('TIPURI DE APLICAȚII',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.38),
                      fontSize: 13,
                      letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),
              const SizedBox(height: 32),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.language, color: _accent, size: 32),
                              const SizedBox(width: 16),
                              Text(
                                'APLICAȚII WEB',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ).animate().fadeIn(duration: 500.ms, delay: 200.ms),
                          const SizedBox(height: 24),
                          Text(
                            'Aplicațiile web rulează direct în browser și nu necesită instalare pe dispozitivul utilizatorului. '
                                'Sunt împărțite în două componente principale:\n\n'
                                '• frontend — interfața vizuală cu care interacționează utilizatorul\n'
                                '• backend — logica serverului, baza de date și procesarea datelor.\n\n'
                                'Astăzi, aproape orice afacere are o prezență web, de la simple pagini de prezentare la platforme '
                                'SaaS complexe, rețele sociale sau magazine online cu milioane de produse. Evoluția a mers de la '
                                'site-uri statice HTML la aplicații SPA care se comportă ca aplicații desktop, cu actualizări în '
                                'timp real și experiențe fluide pentru utilizatori.',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: 15,
                              height: 1.6,
                            ),
                          ).animate().fadeIn(duration: 500.ms, delay: 300.ms),
                          const SizedBox(height: 28),
                          Text(
                            'Limbaje & Tehnologii:',
                            style: TextStyle(
                              color: _accent,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1,
                            ),
                          ).animate().fadeIn(duration: 500.ms, delay: 400.ms),
                          const SizedBox(height: 14),
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: _languages.length,
                              itemBuilder: (context, index) {
                                final parts = _languages[index].split('—');
                                final langName = parts[0].trim();
                                final langDesc =
                                parts.length > 1 ? parts[1].trim() : '';
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: Icon(Icons.circle,
                                            size: 6, color: _accent),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            style: TextStyle(
                                              fontSize: 14,
                                              height: 1.4,
                                              color: Colors.white
                                                  .withOpacity(0.7),
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '$langName ',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              if (langDesc.isNotEmpty)
                                                TextSpan(text: '— $langDesc'),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animate().slideX(
                                    begin: -0.1,
                                    end: 0,
                                    duration: 400.ms,
                                    delay: Duration(
                                        milliseconds: 500 + index * 100));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              _accent.withOpacity(0.15),
                              _accent.withOpacity(0.04),
                            ],
                          ),
                          border: Border.all(color: _accent.withOpacity(0.3)),
                          boxShadow: [
                            BoxShadow(
                              color: _accent.withOpacity(0.12),
                              blurRadius: 24,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            _gifPath,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            errorBuilder: (_, __, ___) => _GifPlaceholder(
                              accent: _accent,
                              path: _gifPath,
                              icon: Icons.monitor,
                              label: 'Web / Dashboard',
                            ),
                          ),
                        ),
                      ).animate().scale(
                          duration: 600.ms,
                          curve: Curves.easeOutBack,
                          delay: 400.ms),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class _GifPlaceholder extends StatelessWidget {
  final Color accent;
  final String path;
  final IconData icon;
  final String label;
  const _GifPlaceholder(
      {required this.accent,
        required this.path,
        required this.icon,
        required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.gif_box_outlined, size: 52, color: accent.withOpacity(0.35)),
          const SizedBox(height: 10),
          Icon(icon, size: 32, color: accent.withOpacity(0.22)),
          const SizedBox(height: 14),
          Text(
            path,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: accent.withOpacity(0.45),
              fontSize: 11,
              fontFamily: 'monospace',
              height: 1.6,
            ),
          ),
          const SizedBox(height: 6),
          Text(label,
              style: TextStyle(color: accent.withOpacity(0.3), fontSize: 12)),
        ],
      ),
    );
  }
}

class _DotGridPainter05 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = Colors.white.withOpacity(0.025)
      ..style = PaintingStyle.fill;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step)
      for (double y = 0; y < size.height; y += step)
        canvas.drawCircle(Offset(x, y), 1.5, p);
  }

  @override
  bool shouldRepaint(_DotGridPainter05 _) => false;
}

class _CircuitBoardPainter extends CustomPainter {
  final double t;
  final Color accent;
  _CircuitBoardPainter(this.t, this.accent);

  static const _hRatios = [0.10, 0.22, 0.35, 0.48, 0.60, 0.73, 0.86, 0.95];
  static const _vRatios = [0.18, 0.33, 0.52, 0.68, 0.84];

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final tp = Paint()..style = PaintingStyle.stroke..strokeWidth = 0.8;

    for (final ry in _hRatios) {
      tp.color = accent.withOpacity(0.055);
      canvas.drawLine(Offset(0, h * ry), Offset(w, h * ry), tp);
    }
    for (final rx in _vRatios) {
      tp.color = accent.withOpacity(0.055);
      canvas.drawLine(Offset(w * rx, 0), Offset(w * rx, h), tp);
    }

    final jFill = Paint()
      ..color = accent.withOpacity(0.13)
      ..style = PaintingStyle.fill;
    final jStroke = Paint()
      ..color = accent.withOpacity(0.07)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;
    for (final ry in _hRatios) {
      for (final rx in _vRatios) {
        final c = Offset(w * rx, h * ry);
        canvas.drawCircle(c, 2.5, jFill);
        canvas.drawRect(
            Rect.fromCenter(center: c, width: 7, height: 7), jStroke);
      }
    }

    for (int i = 0; i < _hRatios.length; i++) {
      final phase = (t * (0.55 + i * 0.05) + i * 0.125) % 1.0;
      final x = w * phase;
      final y = h * _hRatios[i];
      canvas.drawCircle(
          Offset(x, y),
          5,
          Paint()
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6)
            ..color = accent.withOpacity(0.55));
      canvas.drawCircle(
          Offset(x, y), 1.8, Paint()..color = Colors.white.withOpacity(0.9));
      canvas.drawLine(
          Offset(x - 36, y),
          Offset(x, y),
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1.5
            ..shader = LinearGradient(
              colors: [accent.withOpacity(0), accent.withOpacity(0.45)],
            ).createShader(Rect.fromLTWH(x - 36, y - 1, 36, 2)));
    }

    for (int i = 0; i < _vRatios.length; i += 2) {
      final phase = (t * (0.38 + i * 0.04) + i * 0.22) % 1.0;
      final x = w * _vRatios[i];
      final y = h * phase;
      canvas.drawCircle(
          Offset(x, y),
          4,
          Paint()
            ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
            ..color = accent.withOpacity(0.4));
      canvas.drawCircle(
          Offset(x, y), 1.5, Paint()..color = Colors.white.withOpacity(0.75));
    }
  }

  @override
  bool shouldRepaint(_CircuitBoardPainter old) => old.t != t;
}

class _ScanBeamPainter extends CustomPainter {
  final double t;
  final Color accent;
  _ScanBeamPainter(this.t, this.accent);

  @override
  void paint(Canvas canvas, Size size) {
    final ping = (math.sin(t * math.pi * 2) + 1) / 2;
    final y = size.height * ping;
    const beamH = 90.0;

    canvas.drawRect(
      Rect.fromLTWH(0, y - beamH / 2, size.width, beamH),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            accent.withOpacity(0),
            accent.withOpacity(0.05),
            accent.withOpacity(0.11),
            accent.withOpacity(0.05),
            accent.withOpacity(0),
          ],
        ).createShader(
            Rect.fromLTWH(0, y - beamH / 2, size.width, beamH)),
    );

    canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        Paint()
          ..color = accent.withOpacity(0.20)
          ..strokeWidth = 1.0);

    final bp = Paint()
      ..color = accent.withOpacity(0.55)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    const bLen = 10.0;
    const bX = 24.0;
    const bIn = 10.0;
    canvas.drawLine(Offset(bX, y - bLen), Offset(bX, y + bLen), bp);
    canvas.drawLine(Offset(bX, y - bLen), Offset(bX + bIn, y - bLen), bp);
    canvas.drawLine(Offset(bX, y + bLen), Offset(bX + bIn, y + bLen), bp);
    final rx = size.width - bX;
    canvas.drawLine(Offset(rx, y - bLen), Offset(rx, y + bLen), bp);
    canvas.drawLine(Offset(rx, y - bLen), Offset(rx - bIn, y - bLen), bp);
    canvas.drawLine(Offset(rx, y + bLen), Offset(rx - bIn, y + bLen), bp);
  }

  @override
  bool shouldRepaint(_ScanBeamPainter old) => old.t != t;
}