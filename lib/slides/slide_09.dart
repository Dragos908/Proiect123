import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 07 – Aplicații Desktop & Gaming
// ─────────────────────────────────────────────────────────────────────────────

class Slide07DesktopGaming extends StatefulWidget {
  const Slide07DesktopGaming({super.key});
  @override
  State<Slide07DesktopGaming> createState() => _S07State();
}

class _S07State extends State<Slide07DesktopGaming>
    with TickerProviderStateMixin {
  late AnimationController _circuitCtrl;
  late AnimationController _scanCtrl;
  late AnimationController _particleCtrl;
  late AnimationController _neonCtrl;

  @override
  void initState() {
    super.initState();
    _circuitCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 5))
      ..repeat();
    _scanCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 3))
      ..repeat();
    _particleCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 9))
      ..repeat();
    _neonCtrl = AnimationController(
        vsync: this, duration: const Duration(seconds: 6))
      ..repeat();
  }

  @override
  void dispose() {
    _circuitCtrl.dispose();
    _scanCtrl.dispose();
    _particleCtrl.dispose();
    _neonCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_07'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [

        // ── FUNDAL HI-TECH ────────────────────────────────────────────────────
        AnimatedBuilder(
          animation: _circuitCtrl,
          builder: (_, __) => CustomPaint(
            painter: _CircuitBoardPainter07(
              progress: _circuitCtrl.value,
              primaryColor: const Color(0xFF00F0FF),
              secondaryColor: const Color(0xFFFFCC00),
            ),
            size: Size.infinite,
          ),
        ),
        AnimatedBuilder(
          animation: _scanCtrl,
          builder: (_, __) => CustomPaint(
            painter: _ScanLinePainter07(
              progress: _scanCtrl.value,
              color: const Color(0xFF00F0FF),
            ),
            size: Size.infinite,
          ),
        ),
        AnimatedBuilder(
          animation: _particleCtrl,
          builder: (_, __) => CustomPaint(
            painter: _ParticlePainter07(_particleCtrl.value),
            size: Size.infinite,
          ),
        ),

        // Glow orbs
        Positioned(
          top: -120, right: -80,
          child: Container(
            width: 560, height: 560,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00F0FF).withOpacity(0.11),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        Positioned(
          bottom: -100, left: 60,
          child: Container(
            width: 420, height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFFFFCC00).withOpacity(0.09),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        // ── CONȚINUT ─────────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(72, 28, 72, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER ────────────────────────────────────────────────────
              Row(children: [
                Container(width: 56, height: 4, color: const Color(0xFF00F0FF)),
                const SizedBox(width: 16),
                const Text('07', style: TextStyle(
                  color: Color(0xFF00F0FF), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFF00F0FF).withOpacity(0.4)),
                const SizedBox(width: 10),
                Text('TIPURI DE APLICAȚII · PERFORMANȚĂ & COMPLEXITATE',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 14),

              // ── TITLU ─────────────────────────────────────────────────────
              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Colors.white, Color(0xFF90D8FF)],
                ).createShader(b),
                child: const Text(
                  'Desktop & Gaming',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    letterSpacing: -1.5,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 900.ms, delay: 200.ms)
                  .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

              const SizedBox(height: 28),

              // ── LAYOUT: card stânga | GIF mijloc | card dreapta ────────────
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── COLOANA STÂNGA: Desktop ─────────────────────────────
                    Expanded(
                      child: _DomainCard(
                        delay: 300,
                        accentColor: const Color(0xFF00F0FF),
                        icon: Icons.computer_rounded,
                        title: 'Aplicații Desktop',
                        description:
                        'Se instalează local și beneficiază de toate resursele hardware. Sunt esențiale când se necesită performanță ridicată (ex: Office, Photoshop, AutoCAD).',
                        trendText:
                        'Trend: Utilizarea framework-ului Electron (HTML/CSS/JS) permite aplicații web rulate nativ (Slack, Discord, Figma), convenabil pentru dev, dar cu un consum crescut de memorie.',
                        techList: const [
                          _TechItem('C++', 'Performanță maximă'),
                          _TechItem('C#', 'Standard Windows / WPF'),
                          _TechItem('Java', 'Cross-platform'),
                          _TechItem('Python', 'Interfețe Tkinter/PyQt'),
                          _TechItem('Rust', 'Modern, rapid, sigur'),
                          _TechItem('Swift', 'Nativ macOS'),
                        ],
                      ),
                    ),

                    const SizedBox(width: 22),

                    // ── GIF SLOT – mijloc ───────────────────────────────────
                    SizedBox(
                      width: 400,
                      child: _GifSlot()
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 400.ms)
                          .scale(
                        begin: const Offset(0.95, 0.95),
                        end: const Offset(1, 1),
                        duration: 700.ms,
                        delay: 400.ms,
                      ),
                    ),

                    const SizedBox(width: 22),

                    // ── COLOANA DREAPTA: Gaming ─────────────────────────────
                    Expanded(
                      child: _DomainCard(
                        delay: 500,
                        accentColor: const Color(0xFFFFCC00),
                        icon: Icons.sports_esports_rounded,
                        title: 'Aplicații de Gaming',
                        description:
                        'Cele mai complexe software-uri: combină grafică 3D în timp real, fizică, AI, rețelistică și sisteme audio. Generează venituri peste industriile de film și muzică la un loc.',
                        trendText:
                        'Ecosistem: De la producții AAA uriașe (GTA, Call of Duty, Forza Horizon 5) care necesită ani și mii de oameni, la jocuri Indie realizate solo. Motoarele precum Unreal Engine și Unity au democratizat complet accesul.',
                        techList: const [
                          _TechItem('C++', 'Standard AAA / Unreal Engine'),
                          _TechItem('C#', 'Limbaj principal Unity'),
                          _TechItem('Python', 'Prototipuri / Pygame'),
                          _TechItem('JavaScript', 'Jocuri browser / Phaser'),
                          _TechItem('Rust', 'Motorul Bevy, emergent'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // ── NEON STRIP STÂNGA ─────────────────────────────────────────────────
        Positioned(
          left: 0, top: 0, bottom: 0,
          child: AnimatedBuilder(
            animation: _neonCtrl,
            builder: (_, __) => Container(
              width: 6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF00F0FF).withOpacity(0),
                    const Color(0xFF00F0FF).withOpacity(
                        0.75 + 0.25 * math.sin(_neonCtrl.value * 2 * math.pi)),
                    const Color(0xFFFFCC00).withOpacity(0.65),
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
// GIF SLOT
// ─────────────────────────────────────────────────────────────────────────────
class _GifSlot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00F0FF).withOpacity(0.35),
          width: 1.5,
        ),
        color: const Color(0xFF00F0FF).withOpacity(0.04),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [

          // GIF din assets
          Image.asset(
            'assets/04.gif',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class _Corner07 extends StatelessWidget {
  final Color color;
  const _Corner07({required this.color});
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: 22, height: 22,
          child: CustomPaint(painter: _CornerPainter07(color)));
}

class _CornerPainter07 extends CustomPainter {
  final Color color;
  _CornerPainter07(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color.withOpacity(0.65)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), p);
    canvas.drawLine(Offset.zero, Offset(0, size.height), p);
  }
  @override bool shouldRepaint(_) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// DOMAIN CARD – identic cu slide_09 original
// ─────────────────────────────────────────────────────────────────────────────

class _TechItem {
  final String name;
  final String desc;
  const _TechItem(this.name, this.desc);
}

class _DomainCard extends StatelessWidget {
  final int delay;
  final Color accentColor;
  final IconData icon;
  final String title;
  final String description;
  final String trendText;
  final List<_TechItem> techList;

  const _DomainCard({
    required this.delay,
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.trendText,
    required this.techList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: accentColor.withOpacity(0.28),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, color: accentColor, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ]),
          const SizedBox(height: 20),
          Text(description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 15.5,
                height: 1.5,
              )),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: accentColor.withOpacity(0.2)),
            ),
            child: Text(trendText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 14,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                )),
          ),
          const SizedBox(height: 20),
          Text('TEHNOLOGII ȘI LIMBAJE',
              style: TextStyle(
                color: accentColor,
                fontSize: 13,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              )),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: techList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, i) {
                final item = techList[i];
                return Row(children: [
                  Container(
                    width: 90,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    alignment: Alignment.center,
                    child: Text(item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        )),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(item.desc,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        )),
                  ),
                ]);
              },
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.06, end: 0,
        duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS FUNDAL HI-TECH
// ─────────────────────────────────────────────────────────────────────────────

class _CircuitBoardPainter07 extends CustomPainter {
  final double progress;
  final Color primaryColor;
  final Color secondaryColor;
  _CircuitBoardPainter07(
      {required this.progress,
        required this.primaryColor,
        required this.secondaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(42);
    final linePaint = Paint()..style = PaintingStyle.stroke..strokeWidth = 1.0;
    final nodePaint = Paint()..style = PaintingStyle.fill;
    const gridX = 14;
    const gridY = 10;
    final cellW = size.width / gridX;
    final cellH = size.height / gridY;

    for (int i = 0; i < 22; i++) {
      final seed = i * 17;
      final startX = (seed % gridX) * cellW + cellW / 2;
      final startY = ((seed ~/ gridX) % gridY) * cellH + cellH / 2;
      final isGold = rng.nextDouble() > 0.7;
      final baseColor = isGold ? secondaryColor : primaryColor;
      final pulse = math.sin((progress + i / 22.0) * 2 * math.pi);
      final opacity = 0.04 + 0.06 * ((pulse + 1) / 2);
      linePaint.color = baseColor.withOpacity(opacity);
      nodePaint.color = baseColor.withOpacity(opacity * 2.5);

      final path = Path()..moveTo(startX, startY);
      var cx = startX, cy = startY;
      for (int s = 0; s < 4 + rng.nextInt(3); s++) {
        final dir = rng.nextInt(4);
        final len = (1 + rng.nextInt(2)) * cellW;
        double nx = cx, ny = cy;
        switch (dir) {
          case 0: nx = (cx + len).clamp(0, size.width); break;
          case 1: nx = (cx - len).clamp(0, size.width); break;
          case 2: ny = (cy + len).clamp(0, size.height); break;
          case 3: ny = (cy - len).clamp(0, size.height); break;
        }
        path.lineTo(nx, cy);
        path.lineTo(nx, ny);
        canvas.drawCircle(Offset(nx, ny), 3.0, nodePaint);
        cx = nx; cy = ny;
      }
      canvas.drawPath(path, linePaint);
    }

    final dotPaint = Paint()
      ..color = primaryColor.withOpacity(0.04)
      ..style = PaintingStyle.fill;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.4, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_CircuitBoardPainter07 old) => old.progress != progress;
}

class _ScanLinePainter07 extends CustomPainter {
  final double progress;
  final Color color;
  _ScanLinePainter07({required this.progress, required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final y = progress * size.height;
    final rect = Rect.fromLTWH(0, y - 60, size.width, 120);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            color.withOpacity(0.025),
            color.withOpacity(0.055),
            color.withOpacity(0.025),
            Colors.transparent,
          ],
        ).createShader(rect),
    );
    canvas.drawLine(Offset(0, y), Offset(size.width, y),
        Paint()..color = color.withOpacity(0.10)..strokeWidth = 1.0);
  }
  @override
  bool shouldRepaint(_ScanLinePainter07 old) => old.progress != progress;
}

class _ParticlePainter07 extends CustomPainter {
  final double progress;
  static final _rng = math.Random(99);
  static final List<_P07> _pts = List.generate(
    38,
        (i) => _P07(
      x: _rng.nextDouble(),
      speed: 0.05 + _rng.nextDouble() * 0.15,
      size: 1.0 + _rng.nextDouble() * 2.0,
      isGold: _rng.nextDouble() > 0.75,
      phase: _rng.nextDouble(),
    ),
  );
  _ParticlePainter07(this.progress);
  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _pts) {
      final t = (progress * p.speed + p.phase) % 1.0;
      final opacity = 0.15 * math.sin(t * math.pi);
      canvas.drawCircle(
        Offset(p.x * size.width, (1.0 - t) * size.height),
        p.size,
        Paint()
          ..color = (p.isGold
              ? const Color(0xFFFFCC00)
              : const Color(0xFF00F0FF))
              .withOpacity(opacity),
      );
    }
  }
  @override
  bool shouldRepaint(_ParticlePainter07 old) => old.progress != progress;
}

class _P07 {
  final double x, speed, size, phase;
  final bool isGold;
  const _P07(
      {required this.x,
        required this.speed,
        required this.size,
        required this.isGold,
        required this.phase});
}