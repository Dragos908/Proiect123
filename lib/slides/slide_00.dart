import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class _GridPainter extends CustomPainter {
  final double progress;
  _GridPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.06)
      ..strokeWidth = 0.8;
    const step = 52.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), linePaint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
    }

    // Corner brackets
    final glow = Paint()
      ..color = const Color(0xFF00F0FF)
          .withOpacity(0.22 + 0.10 * math.sin(progress * 2 * math.pi))
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    const bSize = 70.0;
    const m = 40.0;
    canvas.drawLine(const Offset(m, m + bSize), const Offset(m, m), glow);
    canvas.drawLine(const Offset(m, m), const Offset(m + bSize, m), glow);
    canvas.drawLine(Offset(size.width - m, size.height - m - bSize),
        Offset(size.width - m, size.height - m), glow);
    canvas.drawLine(Offset(size.width - m, size.height - m),
        Offset(size.width - m - bSize, size.height - m), glow);

    // Scan line
    final scanY =
        ((progress * size.height * 1.4) % (size.height + 80)) - 40;
    final scanPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF00F0FF).withOpacity(0),
          const Color(0xFF00F0FF).withOpacity(0.09),
          const Color(0xFF00F0FF).withOpacity(0),
        ],
      ).createShader(Rect.fromLTWH(0, scanY - 40, size.width, 80));
    canvas.drawRect(
        Rect.fromLTWH(0, scanY - 40, size.width, 80), scanPaint);
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.progress != progress;
}

// ─────────────────────────────────────────────────────────────────────────────
class Slide00Intro extends StatefulWidget {
  const Slide00Intro({super.key});
  @override
  State<Slide00Intro> createState() => _S00State();
}

class _S00State extends State<Slide00Intro>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 6))
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
      key: const ValueKey('slide_00'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
              painter: _GridPainter(_ctrl.value), size: Size.infinite),
        ),

        // Top-right glow
        Positioned(
          top: -160,
          right: -100,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00F0FF).withOpacity(0.14),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        // Bottom-left glow
        Positioned(
          bottom: -120,
          left: 40,
          child: Container(
            width: 480,
            height: 480,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00FF88).withOpacity(0.10),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 90, vertical: 52),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0), // spacer top

              const Spacer(),

              // Main title block
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BIG title
                  ShaderMask(
                    shaderCallback: (b) => const LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFF90D8FF)],
                    ).createShader(b),
                    child: const Text(
                      'Aplicații\nSoftware',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 130,
                        fontWeight: FontWeight.w900,
                        height: 0.96,
                        letterSpacing: -4.0,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms, delay: 400.ms)
                      .slideY(
                      begin: 0.10,
                      end: 0,
                      duration: 800.ms,
                      delay: 400.ms,
                      curve: Curves.easeOut),

                  const SizedBox(height: 36),

                  // Subtitle
                  Text(
                    'proiect anual · IPLT Waldorf 2026',
                    style: TextStyle(
                      color: const Color(0xFF00F0FF).withOpacity(0.88),
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 4,
                    ),
                  ).animate().fadeIn(duration: 700.ms, delay: 900.ms),
                ],
              ),

              const Spacer(),

              // Bottom meta row
              Row(children: [
                _MetaChip(
                    icon: Icons.school_outlined,
                    label: 'IPLT Waldorf'),
                const SizedBox(width: 28),
                _MetaChip(
                    icon: Icons.calendar_today_outlined, label: '2026'),
                const Spacer(),
                // Pulsing dots
                Row(
                  children: List.generate(
                    5,
                        (i) => AnimatedBuilder(
                      animation: _ctrl,
                      builder: (_, __) => Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF00F0FF).withOpacity(
                            0.15 +
                                0.75 *
                                    math.max(
                                        0,
                                        math.sin(
                                            (_ctrl.value * 2 * math.pi) -
                                                i * 0.55)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]).animate().fadeIn(duration: 600.ms, delay: 1200.ms),
            ],
          ),
        ),

        // Left neon strip
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
                    const Color(0xFF00F0FF).withOpacity(0),
                    const Color(0xFF00F0FF).withOpacity(
                        0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi)),
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

class _CyberTag extends StatelessWidget {
  final String label;
  const _CyberTag({required this.label});
  @override
  Widget build(BuildContext context) => Container(
    padding:
    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(
          color: const Color(0xFF00F0FF).withOpacity(0.45)),
      color: const Color(0xFF00F0FF).withOpacity(0.07),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(
      label,
      style: const TextStyle(
        color: Color(0xFF00F0FF),
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 3,
      ),
    ),
  );
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MetaChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Row(children: [
    Icon(icon,
        color: const Color(0xFF00F0FF).withOpacity(0.75), size: 20),
    const SizedBox(width: 10),
    Text(
      label,
      style: TextStyle(
        color: Colors.white.withOpacity(0.60),
        fontSize: 17,
        letterSpacing: 1.5,
      ),
    ),
  ]);
}