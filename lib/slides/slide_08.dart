import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Slide06TipuriAppMobile extends StatefulWidget {
  const Slide06TipuriAppMobile({super.key});
  @override
  State<Slide06TipuriAppMobile> createState() => _Slide06State();
}

class _Slide06State extends State<Slide06TipuriAppMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  final Color _accent = const Color(0xFF00FF88);

  static const String _gifPath = 'assets/02.gif';

  final List<String> _languages = [
    'Swift — limbajul oficial Apple pentru aplicații iOS',
    'Kotlin — limbajul modern și recomandat pentru Android',
    'Java — folosit clasic pentru Android, încă foarte răspândit',
    'Dart — limbajul Flutter, cross-platform dezvoltat de Google',
    'JavaScript — React Native, cross-platform dezvoltat de Meta',
    'C# — Xamarin și MAUI, soluție cross-platform Microsoft',
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
      key: const ValueKey('slide_06'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter06(), size: Size.infinite),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _HexGridPainter(_ctrl.value, _accent),
            size: Size.infinite,
          ),
        ),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _RadarSweepPainter(_ctrl.value, _accent),
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
                Text('06',
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
                              Icon(Icons.smartphone, color: _accent, size: 32),
                              const SizedBox(width: 16),
                              Text(
                                'APLICAȚII MOBILE',
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
                            'Aplicațiile mobile sunt proiectate pentru dispozitive portabile (telefoane, tablete și ceasuri '
                                'inteligente). Există trei abordări principale: native (construite specific pentru iOS sau Android), '
                                'hibride (combină tehnologii web) și cross-platform (un singur cod care rulează pe ambele platforme).\n\n'
                                'Aplicațiile native oferă cea mai bună performanță și integrare cu sistemul de operare, dar necesită '
                                'echipe separate pentru iOS și Android, ceea ce înseamnă costuri mai mari. Soluțiile cross-platform '
                                'precum Flutter și React Native au câștigat enorm teren în ultimii ani, permițând companiilor să '
                                'lanseze pe ambele platforme dintr-un singur cod sursă.',
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
                                        padding:
                                            const EdgeInsets.only(top: 6),
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
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                              if (langDesc.isNotEmpty)
                                                TextSpan(
                                                    text: '— $langDesc'),
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

                    // ── GIF panel dreapta ─────────────────────────────────
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _accent.withOpacity(0.35),
                            width: 1.5,
                          ),
                          color: _accent.withOpacity(0.04),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.asset(
                          _gifPath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (_, __, ___) => _GifPlaceholder(
                            accent: _accent,
                            path: _gifPath,
                            icon: Icons.phone_iphone,
                            label: 'Aplicație Mobile (Flutter)',
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

// ─────────────────────────────────────────────────────────────────────────────
// GIF PLACEHOLDER
// ─────────────────────────────────────────────────────────────────────────────
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
          Icon(Icons.gif_box_outlined,
              size: 52, color: accent.withOpacity(0.35)),
          const SizedBox(height: 10),
          Icon(icon, size: 32, color: accent.withOpacity(0.22)),
          const SizedBox(height: 14),
          Text(path,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: accent.withOpacity(0.45),
                fontSize: 11,
                fontFamily: 'monospace',
                height: 1.6,
              )),
          const SizedBox(height: 6),
          Text(label,
              style:
                  TextStyle(color: accent.withOpacity(0.3), fontSize: 12)),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS
// ─────────────────────────────────────────────────────────────────────────────

class _DotGridPainter06 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter06 _) => false;
}

class _HexGridPainter extends CustomPainter {
  final double t;
  final Color accent;
  _HexGridPainter(this.t, this.accent);

  Path _hexPath(Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = -math.pi / 6 + math.pi / 3 * i;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0)
        path.moveTo(x, y);
      else
        path.lineTo(x, y);
    }
    return path..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    const r = 26.0;
    final rH = r * math.sqrt(3) / 2;
    final cols = (size.width / (r * 1.5)).ceil() + 2;
    final rows = (size.height / (r * math.sqrt(3))).ceil() + 2;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7;
    final fillPaint = Paint()..style = PaintingStyle.fill;

    for (int col = -1; col < cols; col++) {
      for (int row = -1; row < rows; row++) {
        final cx = col * r * 1.5;
        final cy = row * r * math.sqrt(3) + (col.isOdd ? rH : 0.0);
        final center = Offset(cx, cy);

        final wavePhase = t * 2 * math.pi -
            (cx / size.width * 4 + cy / size.height * 2.5);
        final wave = (math.sin(wavePhase) + 1) / 2;

        strokePaint.color = accent.withOpacity(0.04 + wave * 0.09);
        canvas.drawPath(_hexPath(center, r - 1.5), strokePaint);

        if ((col.abs() * 5 + row.abs() * 7) % 13 < 3) {
          final glow =
              (math.sin(t * 2 * math.pi * 1.4 + col * 0.9 + row * 1.2) +
                      1) /
                  2;
          if (glow > 0.58) {
            fillPaint.color = accent.withOpacity((glow - 0.58) * 0.18);
            canvas.drawPath(_hexPath(center, r - 1.5), fillPaint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(_HexGridPainter old) => old.t != t;
}

class _RadarSweepPainter extends CustomPainter {
  final double t;
  final Color accent;

  static final _rng = math.Random(42);
  static final _blips = List.generate(10, (_) {
    return (
      angle: _rng.nextDouble() * 2 * math.pi,
      r: _rng.nextDouble() * 0.7 + 0.15,
    );
  });

  _RadarSweepPainter(this.t, this.accent);

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width * 1.08, -size.height * 0.08);
    final maxR = size.width * 1.25;

    final ringP = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.7
      ..color = accent.withOpacity(0.05);
    for (int i = 1; i <= 5; i++) {
      canvas.drawCircle(origin, maxR * i / 5, ringP);
    }

    final sweepAngle = t * 2 * math.pi + math.pi * 0.6;

    const trailSteps = 45;
    for (int i = 0; i < trailSteps; i++) {
      final frac = 1.0 - i / trailSteps.toDouble();
      final angle = sweepAngle - i * 0.06;
      canvas.drawLine(
        origin,
        Offset(origin.dx + maxR * math.cos(angle),
            origin.dy + maxR * math.sin(angle)),
        Paint()
          ..color = accent.withOpacity(frac * 0.18)
          ..strokeWidth = frac * 1.6,
      );
    }

    canvas.drawLine(
      origin,
      Offset(origin.dx + maxR * math.cos(sweepAngle),
          origin.dy + maxR * math.sin(sweepAngle)),
      Paint()
        ..color = accent.withOpacity(0.40)
        ..strokeWidth = 1.8,
    );

    for (final b in _blips) {
      final angleDiff =
          ((sweepAngle % (2 * math.pi)) - b.angle + 2 * math.pi) %
              (2 * math.pi);
      if (angleDiff < 0.3) {
        final fade = 1.0 - angleDiff / 0.3;
        final bx = origin.dx + maxR * b.r * math.cos(b.angle);
        final by = origin.dy + maxR * b.r * math.sin(b.angle);
        canvas.drawCircle(
            Offset(bx, by),
            4,
            Paint()
              ..color = accent.withOpacity(fade * 0.85)
              ..maskFilter =
                  const MaskFilter.blur(BlurStyle.normal, 4));
        canvas.drawCircle(Offset(bx, by), 2,
            Paint()..color = Colors.white.withOpacity(fade));
      }
    }
  }

  @override
  bool shouldRepaint(_RadarSweepPainter old) => old.t != t;
}