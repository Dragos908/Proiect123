import 'dart:math' as math;
// ignore: avoid_web_libraries_in_flutter
import 'dart:ui_web' as ui_web;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide QR + Demo – Scanează & Explorează Aplicația  (Flutter WEB)
// ─────────────────────────────────────────────────────────────────────────────

const _appUrl = 'https://dragos908.github.io/ProiectAnual/';
const _iframeViewType = 'qr-demo-iframe';

bool _iframeRegistered = false;
void _ensureIframeRegistered() {
  if (_iframeRegistered) return;
  _iframeRegistered = true;
  ui_web.platformViewRegistry.registerViewFactory(
    _iframeViewType,
        (int viewId) {
      final iframe = html.IFrameElement()
        ..src = _appUrl
        ..style.border = 'none'
        ..style.width = '100%'
        ..style.height = '100%'
        ..allow = 'fullscreen'
        ..setAttribute('loading', 'lazy');
      return iframe;
    },
  );
}

// ─────────────────────────────────────────────────────────────────────────────
class SlideQrDemo extends StatefulWidget {
  const SlideQrDemo({super.key});
  @override
  State<SlideQrDemo> createState() => _SlideQrDemoState();
}

class _SlideQrDemoState extends State<SlideQrDemo>
    with TickerProviderStateMixin {
  late AnimationController _ctrl;      // glow pulse  (6s)
  late AnimationController _scanCtrl;  // scan line   (3s)
  late AnimationController _hexCtrl;   // hex grid    (20s)
  late AnimationController _gridCtrl;  // grid flow   (8s)

  @override
  void initState() {
    super.initState();
    _ensureIframeRegistered();
    _ctrl     = AnimationController(vsync: this, duration: const Duration(seconds: 6))..repeat();
    _scanCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat();
    _hexCtrl  = AnimationController(vsync: this, duration: const Duration(seconds: 20))..repeat();
    _gridCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 8))..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    _scanCtrl.dispose();
    _hexCtrl.dispose();
    _gridCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_qr_demo'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [

        // ── Haitech background (hex grid + circuit lines + dots) ──────────
        AnimatedBuilder(
          animation: Listenable.merge([_hexCtrl, _gridCtrl]),
          builder: (_, __) => CustomPaint(
            painter: _HaitechBgPainter(
              hexAngle: _hexCtrl.value * 2 * math.pi,
              gridOffset: _gridCtrl.value,
            ),
            size: Size.infinite,
          ),
        ),

        // ── Scan line ─────────────────────────────────────────────────────
        AnimatedBuilder(
          animation: _scanCtrl,
          builder: (_, __) => CustomPaint(
            painter: _ScanLinePainter(progress: _scanCtrl.value),
            size: Size.infinite,
          ),
        ),

        // ── Glow orb cyan (top-right) ─────────────────────────────────────
        Positioned(
          top: -120, right: -80,
          child: AnimatedBuilder(
            animation: _ctrl,
            builder: (_, __) => Container(
              width: 600, height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color(0xFF00F0FF).withOpacity(
                      (0.10 + 0.06 * math.sin(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                  Colors.transparent,
                ]),
              ),
            ),
          ),
        ),

        // ── Glow orb green (bottom-left) ──────────────────────────────────
        Positioned(
          bottom: -100, left: 50,
          child: AnimatedBuilder(
            animation: _ctrl,
            builder: (_, __) => Container(
              width: 450, height: 450,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color(0xFF00FF88).withOpacity(
                      (0.07 + 0.04 * math.cos(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                  Colors.transparent,
                ]),
              ),
            ),
          ),
        ),

        // ── Neon strip stânga ─────────────────────────────────────────────
        Positioned(
          left: 0, top: 0, bottom: 0,
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
                    Color(0xFF00F0FF).withOpacity(
                        (0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                    const Color(0xFF00FF88).withOpacity(0.65),
                    const Color(0xFF00F0FF).withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ),

        // ── Conținut principal ────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 36, 60, 36),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              // ════════════════════════════════════════════════════════════
              // STÂNGA – QR COD
              // ════════════════════════════════════════════════════════════
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    // Badge „SCANEAZĂ"
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF00F0FF).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: const Color(0xFF00F0FF).withOpacity(0.5)),
                      ),
                      child: const Text(
                        'SCANEAZĂ',
                        style: TextStyle(
                          color: Color(0xFF00F0FF),
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 3,
                        ),
                      ),
                    ).animate().fadeIn(duration: 500.ms),

                    const SizedBox(height: 28),

                    // QR cu corner brackets haitech + glow pulsant
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Corner brackets animati
                        AnimatedBuilder(
                          animation: _ctrl,
                          builder: (_, __) => CustomPaint(
                            painter: _CornerBracketsPainter(
                              pulse: (0.5 + 0.5 * math.sin(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0),
                            ),
                            child: const SizedBox(width: 390, height: 390),
                          ),
                        ),

                        // QR cu glow
                        AnimatedBuilder(
                          animation: _ctrl,
                          builder: (_, child) => Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.97),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF00F0FF).withOpacity(
                                      (0.35 + 0.20 * math.sin(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                                  blurRadius: 60,
                                  spreadRadius: 10,
                                ),
                                BoxShadow(
                                  color: Color(0xFF00FF88).withOpacity(
                                      (0.15 + 0.10 * math.cos(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                                  blurRadius: 80,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: child,
                          ),
                          child: QrImageView(
                            data: _appUrl,
                            version: QrVersions.auto,
                            size: 320,
                            backgroundColor: Colors.white,
                            eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Color(0xFF020609),
                            ),
                            dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Color(0xFF020609),
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 800.ms, delay: 300.ms)
                            .scale(
                          begin: const Offset(0.85, 0.85),
                          duration: 700.ms,
                          delay: 300.ms,
                          curve: Curves.easeOutBack,
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Titlu
                    ShaderMask(
                      shaderCallback: (b) => const LinearGradient(
                        colors: [Colors.white, Color(0xFF90D8FF)],
                      ).createShader(b),
                      child: const Text(
                        'Proiectul Meu',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                        ),
                      ),
                    ).animate().fadeIn(duration: 700.ms, delay: 500.ms),

                    const SizedBox(height: 18),

                    // Instrucțiune
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.phone_iphone,
                            color: const Color(0xFF00FF88).withOpacity(0.8),
                            size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Deschide camera și scanează codul',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.55),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ).animate().fadeIn(duration: 600.ms, delay: 900.ms),
                  ],
                ),
              ),

              // ── Separator vertical animat ─────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: AnimatedBuilder(
                  animation: _ctrl,
                  builder: (_, __) => Container(
                    width: 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF00F0FF).withOpacity(0),
                          Color(0xFF00F0FF).withOpacity(
                              (0.35 + 0.15 * math.sin(_ctrl.value * 2 * math.pi)).clamp(0.0, 1.0)),
                          const Color(0xFF00FF88).withOpacity(0.30),
                          const Color(0xFF00F0FF).withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // ════════════════════════════════════════════════════════════
              // DREAPTA – IFRAME LIVE DEMO (fără header, fără URL)
              // ════════════════════════════════════════════════════════════
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: const Color(0xFF00FF88).withOpacity(0.25)),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF00FF88).withOpacity(0.08),
                          blurRadius: 32,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: const HtmlElementView(viewType: _iframeViewType),
                  ),
                ).animate().fadeIn(duration: 700.ms, delay: 300.ms),
              ),

            ],
          ),
        ),
      ]),
    );
  }
}

// ── Corner brackets haitech ───────────────────────────────────────────────────
class _CornerBracketsPainter extends CustomPainter {
  final double pulse;
  _CornerBracketsPainter({required this.pulse});

  @override
  void paint(Canvas canvas, Size size) {
    const len = 36.0;
    const gap = 20.0;

    final paintCyan = Paint()
      ..color = Color(0xFF00F0FF).withOpacity((0.5 + 0.5 * pulse).clamp(0.0, 1.0))
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final paintGreen = Paint()
      ..color = Color(0xFF00FF88).withOpacity((0.3 + 0.4 * pulse).clamp(0.0, 1.0))
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final corners = [
      Offset(gap, gap),
      Offset(size.width - gap, gap),
      Offset(gap, size.height - gap),
      Offset(size.width - gap, size.height - gap),
    ];

    for (final c in corners) {
      final dx = c.dx < size.width / 2 ? 1.0 : -1.0;
      final dy = c.dy < size.height / 2 ? 1.0 : -1.0;
      canvas.drawLine(c, Offset(c.dx + dx * len, c.dy), paintCyan);
      canvas.drawLine(c, Offset(c.dx, c.dy + dy * len), paintCyan);
    }

    // Inner green thin brackets
    const g2 = gap + 8.0;
    const l2 = len * 0.5;
    final corners2 = [
      Offset(g2, g2),
      Offset(size.width - g2, g2),
      Offset(g2, size.height - g2),
      Offset(size.width - g2, size.height - g2),
    ];
    for (final c in corners2) {
      final dx = c.dx < size.width / 2 ? 1.0 : -1.0;
      final dy = c.dy < size.height / 2 ? 1.0 : -1.0;
      canvas.drawLine(c, Offset(c.dx + dx * l2, c.dy), paintGreen);
      canvas.drawLine(c, Offset(c.dx, c.dy + dy * l2), paintGreen);
    }
  }

  @override
  bool shouldRepaint(_CornerBracketsPainter old) => old.pulse != pulse;
}

// ── Scan line painter ─────────────────────────────────────────────────────────
class _ScanLinePainter extends CustomPainter {
  final double progress;
  _ScanLinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final y = size.height * progress;
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          const Color(0xFF00F0FF).withOpacity(0.0),
          const Color(0xFF00F0FF).withOpacity(0.15),
          const Color(0xFF00F0FF).withOpacity(0.0),
          Colors.transparent,
        ],
        stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, y - 60, size.width, 120));

    canvas.drawRect(Rect.fromLTWH(0, y - 60, size.width, 120), paint);

    final linePaint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.30)
      ..strokeWidth = 1.0;
    canvas.drawLine(Offset(0, y), Offset(size.width, y), linePaint);
  }

  @override
  bool shouldRepaint(_ScanLinePainter old) => old.progress != progress;
}

// ── Haitech background painter (hex grid + circuit lines + dots) ──────────────
class _HaitechBgPainter extends CustomPainter {
  final double hexAngle;
  final double gridOffset;
  _HaitechBgPainter({required this.hexAngle, required this.gridOffset});

  @override
  void paint(Canvas canvas, Size size) {
    _drawHexGrid(canvas, size);
    _drawCircuitLines(canvas, size);
    _drawDotGrid(canvas, size);
  }

  void _drawHexGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.030)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.8;

    const r = 28.0;
    final dx = r * math.sqrt(3);
    const dy = r * 1.5;

    for (double row = -1; row < size.height / dy + 2; row++) {
      for (double col = -1; col < size.width / dx + 2; col++) {
        final offsetX = (row % 2 == 0) ? 0.0 : dx / 2;
        final cx = col * dx + offsetX;
        final cy = row * dy + (gridOffset * dy * 2) % (dy * 2);
        _drawHex(canvas, paint, Offset(cx, cy), r);
      }
    }
  }

  void _drawHex(Canvas canvas, Paint paint, Offset center, double r) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = math.pi / 180 * (60 * i - 30);
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0) path.moveTo(x, y); else path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawCircuitLines(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00FF88).withOpacity(0.055)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final nodePaint = Paint()
      ..color = const Color(0xFF00FF88).withOpacity(0.12)
      ..style = PaintingStyle.fill;

    final rng = math.Random(42);
    for (int i = 0; i < 18; i++) {
      final startX = rng.nextDouble() * size.width;
      final startY = rng.nextDouble() * size.height;
      final len1 = 40.0 + rng.nextDouble() * 80;
      final len2 = 30.0 + rng.nextDouble() * 60;
      final horizontal = rng.nextBool();

      final mid = horizontal
          ? Offset(startX + len1, startY)
          : Offset(startX, startY + len1);
      final end = horizontal
          ? Offset(mid.dx, mid.dy + len2)
          : Offset(mid.dx + len2, mid.dy);

      canvas.drawLine(Offset(startX, startY), mid, paint);
      canvas.drawLine(mid, end, paint);
      canvas.drawCircle(mid, 2.5, nodePaint);
    }
  }

  void _drawDotGrid(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.035)
      ..style = PaintingStyle.fill;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_HaitechBgPainter old) =>
      old.hexAngle != hexAngle || old.gridOffset != gridOffset;
}