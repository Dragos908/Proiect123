import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ── DATA ──────────────────────────────────────────────────────────────────────
const _revenueData = [
  _BarData('2016', 88,  false, Color(0xFF00F0FF)),
  _BarData('2017', 120, false, Color(0xFF00F0FF)),
  _BarData('2018', 155, false, Color(0xFF00F0FF)),
  _BarData('2019', 195, false, Color(0xFF00F0FF)),
  _BarData('2020', 250, false, Color(0xFF00F0FF)),
  _BarData('2021', 340, false, Color(0xFF00F0FF)),
  _BarData('2022', 430, false, Color(0xFF00F0FF)),
  _BarData('2023', 518, false, Color(0xFF5BE0FF)),
  _BarData('2024', 597, false, Color(0xFF5BE0FF)),
  _BarData('2025', 648, false, Color(0xFF5BE0FF)),
  _BarData('2026', 674, true,  Color(0xFF00FF88)),
  _BarData('2027', 705, true,  Color(0xFFFFCC00)),
];

class _BarData {
  final String year;
  final double value; // billions USD
  final bool highlight;
  final Color color;
  const _BarData(this.year, this.value, this.highlight, this.color);
}

// ── SLIDE 02 – VENITURI ───────────────────────────────────────────────────────
class Slide02Revenue extends StatefulWidget {
  const Slide02Revenue({super.key});

  @override
  State<Slide02Revenue> createState() => _Slide02State();
}

class _Slide02State extends State<Slide02Revenue>
    with TickerProviderStateMixin {
  late AnimationController _glowCtrl;
  late AnimationController _barsCtrl;
  late Animation<double> _barsAnim;

  @override
  void initState() {
    super.initState();

    _glowCtrl =
    AnimationController(vsync: this, duration: const Duration(seconds: 5))
      ..repeat();

    _barsCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));

    _barsAnim = CurvedAnimation(parent: _barsCtrl, curve: Curves.easeOutCubic);

    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) _barsCtrl.forward();
    });
  }

  @override
  void dispose() {
    _glowCtrl.dispose();
    _barsCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_02'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF040810), Color(0xFF080C1A), Color(0xFF04101A)],
        ),
      ),
      child: Stack(
        children: [
          CustomPaint(painter: _DotGridPainter2(), size: Size.infinite),

          // Glow orb
          Positioned(
            top: -80,
            left: 60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  const Color(0xFF00FF88).withOpacity(0.1),
                  Colors.transparent,
                ]),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(72, 44, 72, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SlideLabel2(number: '02', topic: 'ECONOMIE DIGITALĂ · 2026'),
                        const SizedBox(height: 18),
                        ShaderMask(
                          shaderCallback: (b) => const LinearGradient(
                            colors: [Colors.white, Color(0xFF90D8FF)],
                          ).createShader(b),
                          child: const Text(
                            'Venituri Globale\nAplicații Mobile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 82,
                              fontWeight: FontWeight.w900,
                              height: 1.05,
                              letterSpacing: -1.5,
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms),

                    Row(
                      children: [
                        const _KpiCard(
                          value: '\$674B',
                          label: '2026\nestimat',
                          color: Color(0xFF00FF88),
                        ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
                        const SizedBox(width: 16),
                        const _KpiCard(
                          value: '\$705B', // Valoare corectată
                          label: '2027\nproiectat',
                          color: Color(0xFFFFCC00),
                        ).animate().fadeIn(duration: 600.ms, delay: 450.ms),
                        const SizedBox(width: 16),
                        const _KpiCard(
                          value: '+666%', // Procentaj corectat matematic (88 -> 674)
                          label: 'creștere\n2016→2026',
                          color: Color(0xFF00F0FF),
                        ).animate().fadeIn(duration: 600.ms, delay: 600.ms),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Expanded(
                  child: _AnimatedBarChart(
                    data: _revenueData,
                    animation: _barsAnim,
                    glowController: _glowCtrl,
                  ).animate().fadeIn(duration: 700.ms, delay: 200.ms),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    const _LegendDot(color: Color(0xFF00F0FF), label: 'Istoric confirmat'),
                    const SizedBox(width: 24),
                    const _LegendDot(color: Color(0xFF5BE0FF), label: 'Estimare'),
                    const SizedBox(width: 24),
                    const _LegendDot(color: Color(0xFF00FF88), label: '\$674B (2026 – Target)'),
                    const SizedBox(width: 24),
                    const _LegendDot(color: Color(0xFFFFCC00), label: '\$705B (2027 – Proiectat)'), // Valoare corectată
                  ],
                ).animate().fadeIn(duration: 600.ms, delay: 1600.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── PAINTERUL ȘI COMPONENTELE ─────────────────────────────────────────────────
class _AnimatedBarChart extends StatelessWidget {
  final List<_BarData> data;
  final Animation<double> animation;
  final AnimationController glowController;

  const _AnimatedBarChart({
    required this.data,
    required this.animation,
    required this.glowController,
  });

  @override
  Widget build(BuildContext context) {
    final maxVal = data.map((d) => d.value).reduce(math.max);
    return AnimatedBuilder(
      animation: Listenable.merge([animation, glowController]),
      builder: (context, _) => CustomPaint(
        painter: _BarChartPainter(
          data: data,
          progress: animation.value,
          glowPulse: glowController.value,
          maxVal: maxVal,
        ),
        size: Size.infinite,
      ),
    );
  }
}

class _BarChartPainter extends CustomPainter {
  final List<_BarData> data;
  final double progress;
  final double glowPulse;
  final double maxVal;

  _BarChartPainter({
    required this.data,
    required this.progress,
    required this.glowPulse,
    required this.maxVal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final n = data.length;
    const paddingLeft = 60.0;
    const paddingBottom = 48.0;
    const paddingTop = 24.0;
    const barGap = 12.0;

    final chartW = size.width - paddingLeft;
    final chartH = size.height - paddingBottom - paddingTop;
    final barW = (chartW - barGap * (n - 1)) / n;

    final gridPaint = Paint()..color = const Color(0xFF1A2540)..strokeWidth = 1;
    final labelStyle = const TextStyle(color: Color(0xFF4A6080), fontSize: 14, fontWeight: FontWeight.w500);

    const gridSteps = 5;
    for (int i = 0; i <= gridSteps; i++) {
      final ratio = i / gridSteps;
      final y = paddingTop + chartH * (1 - ratio);
      canvas.drawLine(Offset(paddingLeft, y), Offset(size.width, y), gridPaint);
      final labelVal = (maxVal * ratio / 100).round();
      final tp = TextPainter(text: TextSpan(text: '\$${labelVal * 100}B', style: labelStyle), textDirection: TextDirection.ltr)..layout();
      tp.paint(canvas, Offset(0, y - tp.height / 2));
    }

    for (int i = 0; i < n; i++) {
      final d = data[i];
      final x = paddingLeft + i * (barW + barGap);
      final barDelay = i / (n * 1.2);
      final barProgress = math.max(0.0, math.min(1.0, (progress - barDelay) / (1.0 - barDelay + 0.001)));

      final normalizedH = (d.value / maxVal) * chartH * barProgress;
      final top = paddingTop + chartH - normalizedH;
      final rect = Rect.fromLTWH(x, top, barW, normalizedH);

      if (d.highlight && barProgress > 0.9) {
        final glowPaint = Paint()
          ..color = d.color.withOpacity(0.18 + 0.1 * math.sin(glowPulse * 2 * math.pi))
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 18);
        canvas.drawRRect(RRect.fromRectAndRadius(rect.inflate(8), const Radius.circular(4)), glowPaint);
      }

      final barPaint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [d.color.withOpacity(0.5), d.color.withOpacity(d.highlight ? 1.0 : 0.75)],
        ).createShader(rect);

      canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(3)), barPaint);

      if (barProgress > 0.05) {
        final capPaint = Paint()..color = d.color..strokeWidth = 2;
        canvas.drawLine(Offset(x, top), Offset(x + barW, top), capPaint);
      }

      if (barProgress > 0.85) {
        final opacity = math.min(1.0, (barProgress - 0.85) / 0.15);
        final tp = TextPainter(
          text: TextSpan(
            text: '\$${d.value.toInt()}B',
            style: TextStyle(
              color: d.highlight ? d.color.withOpacity(opacity) : Colors.white.withOpacity(0.55 * opacity),
              fontSize: d.highlight ? 15 : 13,
              fontWeight: d.highlight ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(x + barW / 2 - tp.width / 2, top - tp.height - 4));
      }

      final tp2 = TextPainter(
        text: TextSpan(
          text: d.year,
          style: TextStyle(
            color: d.highlight ? d.color : Colors.white.withOpacity(0.4),
            fontSize: d.highlight ? 15 : 14,
            fontWeight: d.highlight ? FontWeight.w800 : FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp2.paint(canvas, Offset(x + barW / 2 - tp2.width / 2, paddingTop + chartH + 12));

      // Dashed rect pentru estimări (începând cu 2023 până la 2026 inclusiv)
      if (d.year.compareTo('2022') > 0 && d.year != '2027') {
        final dashedPaint = Paint()..color = d.color.withOpacity(0.35)..strokeWidth = 1..style = PaintingStyle.stroke;
        _drawDashedRect(canvas, rect, 4, dashedPaint);
      }
    }
  }

  void _drawDashedRect(Canvas canvas, Rect rect, double dashLen, Paint paint) {
    final path = Path()..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(3)));
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double dist = 0;
      while (dist < metric.length) {
        final end = math.min<double>(dist + dashLen, metric.length);
        canvas.drawPath(metric.extractPath(dist, end), paint);
        dist += dashLen * 2;
      }
    }
  }

  @override
  bool shouldRepaint(_BarChartPainter old) => old.progress != progress || old.glowPulse != glowPulse;
}

class _KpiCard extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _KpiCard({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.35)),
        color: color.withOpacity(0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: 48, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 16)),
        ],
      ),
    );
  }
}

class _SlideLabel2 extends StatelessWidget {
  final String number;
  final String topic;
  const _SlideLabel2({required this.number, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(number, style: const TextStyle(color: Color(0xFF00FF88), fontSize: 18, fontWeight: FontWeight.w700)),
        const SizedBox(width: 10),
        Container(width: 1, height: 18, color: const Color(0xFF00FF88).withOpacity(0.4)),
        const SizedBox(width: 10),
        Text(topic, style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 16, letterSpacing: 3)),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 14, height: 14, decoration: BoxDecoration(shape: BoxShape.circle, color: color)),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 15)),
      ],
    );
  }
}

class _DotGridPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF00F0FF).withOpacity(0.035);
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }
  @override
  bool shouldRepaint(_DotGridPainter2 _) => false;
}