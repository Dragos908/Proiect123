import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Slide04Milestones extends StatefulWidget {
  const Slide04Milestones({super.key});
  @override
  State<Slide04Milestones> createState() => _S04State();
}

class _S04State extends State<Slide04Milestones>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  static const _particles = [
    _Particle(x:0.5,y:0.95,speedX:0.1,speedY:0.02,amplitude:0.02,phase:0.0,radius:1.5,opacity:0.06,pulseSpeed:0.3,useColor2:true),
    _Particle(x:0.804,y:0.168,speedX:0.18,speedY:0.03,amplitude:0.035,phase:0.4,radius:2.3,opacity:0.10,pulseSpeed:0.45,useColor2:false),
    _Particle(x:0.052,y:0.538,speedX:0.26,speedY:0.04,amplitude:0.05,phase:0.8,radius:3.1,opacity:0.14,pulseSpeed:0.6,useColor2:false),
    _Particle(x:0.856,y:0.775,speedX:0.34,speedY:0.05,amplitude:0.065,phase:1.2,radius:3.9,opacity:0.18,pulseSpeed:0.75,useColor2:true),
    _Particle(x:0.423,y:0.057,speedX:0.42,speedY:0.06,amplitude:0.02,phase:1.6,radius:4.7,opacity:0.06,pulseSpeed:0.9,useColor2:false),
    _Particle(x:0.257,y:0.879,speedX:0.5,speedY:0.02,amplitude:0.035,phase:2.0,radius:1.5,opacity:0.10,pulseSpeed:1.05,useColor2:false),
    _Particle(x:0.935,y:0.386,speedX:0.58,speedY:0.03,amplitude:0.05,phase:2.4,radius:2.3,opacity:0.14,pulseSpeed:0.3,useColor2:true),
    _Particle(x:0.102,y:0.29,speedX:0.1,speedY:0.04,amplitude:0.065,phase:2.8,radius:3.1,opacity:0.18,pulseSpeed:0.45,useColor2:false),
    _Particle(x:0.651,y:0.924,speedX:0.18,speedY:0.05,amplitude:0.02,phase:3.2,radius:3.9,opacity:0.06,pulseSpeed:0.6,useColor2:false),
    _Particle(x:0.675,y:0.086,speedX:0.26,speedY:0.06,amplitude:0.035,phase:3.6,radius:4.7,opacity:0.10,pulseSpeed:0.75,useColor2:true),
    _Particle(x:0.091,y:0.687,speedX:0.34,speedY:0.02,amplitude:0.05,phase:4.0,radius:1.5,opacity:0.14,pulseSpeed:0.9,useColor2:false),
    _Particle(x:0.928,y:0.639,speedX:0.42,speedY:0.03,amplitude:0.065,phase:4.4,radius:2.3,opacity:0.18,pulseSpeed:1.05,useColor2:false),
    _Particle(x:0.279,y:0.108,speedX:0.5,speedY:0.04,amplitude:0.02,phase:4.8,radius:3.1,opacity:0.06,pulseSpeed:0.3,useColor2:true),
    _Particle(x:0.398,y:0.938,speedX:0.58,speedY:0.05,amplitude:0.035,phase:5.2,radius:3.9,opacity:0.10,pulseSpeed:0.45,useColor2:false),
    _Particle(x:0.872,y:0.246,speedX:0.1,speedY:0.06,amplitude:0.05,phase:5.6,radius:4.7,opacity:0.14,pulseSpeed:0.6,useColor2:false),
    _Particle(x:0.055,y:0.436,speedX:0.18,speedY:0.02,amplitude:0.065,phase:6.0,radius:1.5,opacity:0.18,pulseSpeed:0.75,useColor2:true),
    _Particle(x:0.785,y:0.849,speedX:0.26,speedY:0.03,amplitude:0.02,phase:6.4,radius:2.3,opacity:0.06,pulseSpeed:0.9,useColor2:false),
    _Particle(x:0.526,y:0.051,speedX:0.34,speedY:0.04,amplitude:0.035,phase:6.8,radius:3.1,opacity:0.10,pulseSpeed:1.05,useColor2:false),
    _Particle(x:0.177,y:0.813,speedX:0.42,speedY:0.05,amplitude:0.05,phase:7.2,radius:3.9,opacity:0.14,pulseSpeed:0.3,useColor2:true),
    _Particle(x:0.95,y:0.487,speedX:0.5,speedY:0.06,amplitude:0.065,phase:7.6,radius:4.7,opacity:0.18,pulseSpeed:0.45,useColor2:false),
    _Particle(x:0.16,y:0.205,speedX:0.58,speedY:0.02,amplitude:0.02,phase:8.0,radius:1.5,opacity:0.06,pulseSpeed:0.6,useColor2:false),
    _Particle(x:0.551,y:0.947,speedX:0.1,speedY:0.03,amplitude:0.035,phase:8.4,radius:2.3,opacity:0.10,pulseSpeed:0.75,useColor2:true),
  ];

  static const _milestones = [
    _MilestoneData(
      year: '1951–52',
      accentColor: Color(0xFF00F0FF),
      icon: Icons.sports_esports_rounded,
      title: 'OXO & LEO I',
      subtitle: 'Primul joc video · Prima aplicație comercială',
      imagePath1: 'assets/images/04.jpg',
      imagePath2: 'assets/images/05.jpg',
      body:
      'OXO (1952) — primul program cu interfață vizuală: o grilă pe 35×16 px, mutări prin disc telefonic. '
          'LEO I (1951) — primul computer de afaceri: gestiona stocurile, logistica și salariile pentru J. Lyons & Co.',
    ),
    _MilestoneData(
      year: '1970s–80s',
      accentColor: Color(0xFFFFCC00),
      icon: Icons.terminal_rounded,
      title: 'C, BASIC &\nProduse de Masă',
      subtitle: 'Limbaje accesibile · VisiCalc · MS Office',
      imagePath1: 'assets/images/06.png',
      imagePath2: 'assets/images/07.jpg',
      body:
      'Limbajele C și BASIC au permis crearea de software divers. '
          'Pong (1972) și Space Invaders (1978) au deschis industria jocurilor. '
          'VisiCalc și Microsoft Office (1989) au redefinit modul de lucru.',
    ),
    _MilestoneData(
      year: '1990s',
      accentColor: Color(0xFF00FF88),
      icon: Icons.language_rounded,
      title: 'Internetul &\nWeb-ul',
      subtitle: 'Yahoo · Google · Hotmail',
      imagePath1: 'assets/images/10.jpg',
      imagePath2: 'assets/images/11.webp',
      body:
      'Web-ul a transformat aplicațiile: rulau direct în browser. '
          'Au apărut Yahoo! (1994), Google (1998), Amazon și eBay (1995). '
          'IBM Simon (1994) a inaugurat era smartphone-ului.',
    ),
    _MilestoneData(
      year: '2008',
      accentColor: Color(0xFFFF6BFF),
      icon: Icons.store_rounded,
      title: 'App Store &\nAndroid Market',
      subtitle: 'Nașterea Economiei Digitale',
      imagePath1: 'assets/images/08.jpg',
      imagePath2: 'assets/images/09.jpg',
      body:
      'Lansarea App Store și Android Market a eliminat barierele dintre dezvoltatori și utilizatori, '
          'creând o economie globală. De la câteva sute de aplicații la milioane de titluri.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 6))
      ..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;

        // Scale factor bazat pe înălțimea ecranului (referință 800px)
        final scale = (h / 800).clamp(0.6, 1.2);

        final headerFontSize = (18 * scale).clamp(12.0, 20.0);
        final titleFontSize = (72 * scale).clamp(36.0, 82.0);
        final subtitleFontSize = (18 * scale).clamp(12.0, 20.0);
        final paddingH = (w * 0.06).clamp(24.0, 72.0);
        final paddingV = (h * 0.04).clamp(16.0, 32.0);

        return Container(
          key: const ValueKey('slide_04'),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
            ),
          ),
          child: Stack(children: [
            CustomPaint(painter: _DotGridPainter04(), size: Size.infinite),
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) => CustomPaint(
                painter: _ParticlePainter04(_ctrl.value),
                size: Size.infinite,
              ),
            ),

            // Glow orbs
            Positioned(
              top: -100, right: -60,
              child: Container(
                width: 500, height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    const Color(0xFF00F0FF).withOpacity(0.10),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),
            Positioned(
              bottom: -80, left: 40,
              child: Container(
                width: 400, height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    const Color(0xFFFF6BFF).withOpacity(0.07),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(paddingH, paddingV, paddingH, paddingV),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── HEADER ──────────────────────────────────────────────
                  Row(children: [
                    Container(width: 56, height: 4, color: const Color(0xFF00F0FF)),
                    const SizedBox(width: 16),
                    Text('04', style: TextStyle(
                      color: const Color(0xFF00F0FF),
                      fontSize: headerFontSize,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4,
                    )),
                    const SizedBox(width: 10),
                    Container(width: 1, height: 18,
                        color: const Color(0xFF00F0FF).withOpacity(0.4)),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text('JALOANE · INDUSTRIE · REVOLUȚIE DIGITALĂ',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.42),
                            fontSize: (13 * scale).clamp(10.0, 16.0),
                            letterSpacing: 2,
                          )),
                    ),
                  ]).animate().fadeIn(duration: 500.ms),

                  SizedBox(height: (8 * scale).clamp(4.0, 12.0)),

                  // ── TITLU ────────────────────────────────────────────────
                  ShaderMask(
                    shaderCallback: (b) => const LinearGradient(
                      colors: [Colors.white, Color(0xFF90D8FF)],
                    ).createShader(b),
                    child: Text(
                      'De la OXO la App Store',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        letterSpacing: -1.5,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms, delay: 200.ms)
                      .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

                  SizedBox(height: (4 * scale).clamp(2.0, 6.0)),

                  Text(
                    'Jocuri, aplicații comerciale, internet și revoluția mobilă — drumul către economia digitală.',
                    style: TextStyle(
                      color: const Color(0xFF00F0FF).withOpacity(0.75),
                      fontSize: subtitleFontSize,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1.0,
                    ),
                  ).animate().fadeIn(duration: 700.ms, delay: 450.ms),

                  SizedBox(height: (14 * scale).clamp(8.0, 22.0)),

                  // ── 4 CARD-URI ───────────────────────────────────────────
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(_milestones.length, (i) {
                        final m = _milestones[i];
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: i == 0 ? 0 : 12),
                            child: _MilestoneCard(
                              data: m,
                              delay: 300 + i * 160,
                              scale: scale,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // Neon strip stânga
            Positioned(
              left: 0, top: 0, bottom: 0,
              child: AnimatedBuilder(
                animation: _ctrl,
                builder: (_, __) => Container(
                  width: 6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xFF00F0FF).withOpacity(0),
                        const Color(0xFF00F0FF).withOpacity(
                            0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi)),
                        const Color(0xFFFF6BFF).withOpacity(0.55),
                        const Color(0xFF00F0FF).withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
        );
      },
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA CLASS
// ─────────────────────────────────────────────────────────────────────────────
class _MilestoneData {
  final String year;
  final Color accentColor;
  final IconData icon;
  final String title;
  final String subtitle;
  final String imagePath1;
  final String imagePath2;
  final String body;

  const _MilestoneData({
    required this.year,
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.imagePath1,
    required this.imagePath2,
    required this.body,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// MILESTONE CARD — complet responsiv
// ─────────────────────────────────────────────────────────────────────────────
class _MilestoneCard extends StatelessWidget {
  final _MilestoneData data;
  final int delay;
  final double scale;

  const _MilestoneCard({
    required this.data,
    required this.delay,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final iconSize = (22 * scale).clamp(16.0, 26.0);
    final yearFontSize = (12 * scale).clamp(9.0, 14.0);
    final titleFontSize = (16 * scale).clamp(12.0, 20.0);
    final subtitleFontSize = (10 * scale).clamp(8.0, 12.0);
    final bodyFontSize = (11.5 * scale).clamp(9.0, 13.5);
    final padding = (14 * scale).clamp(8.0, 20.0);
    final spacing = (8 * scale).clamp(4.0, 14.0);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: data.accentColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: data.accentColor.withOpacity(0.28),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: data.accentColor.withOpacity(0.06),
            blurRadius: 24,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ── Icon + Year badge ──────────────────────────────────────────
          Row(children: [
            Container(
              padding: EdgeInsets.all((7 * scale).clamp(4.0, 10.0)),
              decoration: BoxDecoration(
                color: data.accentColor.withOpacity(0.13),
                shape: BoxShape.circle,
              ),
              child: Icon(data.icon, color: data.accentColor, size: iconSize),
            ),
            SizedBox(width: spacing),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: (8 * scale).clamp(5.0, 12.0),
                  vertical: (4 * scale).clamp(2.0, 6.0),
                ),
                decoration: BoxDecoration(
                  color: data.accentColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: data.accentColor.withOpacity(0.45)),
                ),
                child: Text(data.year, style: TextStyle(
                  color: data.accentColor,
                  fontSize: yearFontSize,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
                )),
              ),
            ),
          ]),

          SizedBox(height: spacing),

          // ── Title ──────────────────────────────────────────────────────
          Text(
            data.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: titleFontSize,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: (3 * scale).clamp(2.0, 5.0)),

          // ── Subtitle ───────────────────────────────────────────────────
          Text(
            data.subtitle,
            style: TextStyle(
              color: data.accentColor.withOpacity(0.72),
              fontSize: subtitleFontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: spacing),

          // ── Imagini — flex responsiv ───────────────────────────────────
          Expanded(
            flex: 5,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: data.accentColor.withOpacity(0.32),
                        width: 1.2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        data.imagePath1,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _placeholder(data.accentColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: (6 * scale).clamp(3.0, 10.0)),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: data.accentColor.withOpacity(0.32),
                        width: 1.2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: Image.asset(
                        data.imagePath2,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _placeholder(data.accentColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: spacing),

          // ── Body text — flex responsiv ─────────────────────────────────
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Text(
                data.body,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.80),
                  fontSize: bodyFontSize,
                  height: 1.45,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.07, end: 0,
        duration: 600.ms, delay: Duration(milliseconds: delay));
  }

  Widget _placeholder(Color color) {
    return Container(
      color: Colors.white.withOpacity(0.03),
      child: Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: color.withOpacity(0.3),
          size: 24,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS
// ─────────────────────────────────────────────────────────────────────────────
class _Particle {
  final double x, y, speedX, speedY, amplitude, phase, radius, opacity, pulseSpeed;
  final bool useColor2;
  const _Particle({
    required this.x, required this.y,
    required this.speedX, required this.speedY,
    required this.amplitude, required this.phase,
    required this.radius, required this.opacity,
    required this.pulseSpeed, required this.useColor2,
  });
}

class _ParticlePainter04 extends CustomPainter {
  final double t;
  _ParticlePainter04(this.t);

  static const _c1 = Color(0xFF00F0FF);
  static const _c2 = Color(0xFFFF6BFF);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _S04State._particles) {
      final dx = p.x * size.width +
          math.sin(t * 2 * math.pi * p.speedX + p.phase) * p.amplitude * size.width;
      final dy = (p.y + t * p.speedY) % 1.0 * size.height;
      final col = p.useColor2 ? _c2 : _c1;
      final paint = Paint()
        ..color = col.withOpacity(p.opacity *
            (0.5 + 0.5 * math.sin(t * 2 * math.pi * p.pulseSpeed + p.phase)))
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(dx, dy), p.radius, paint);
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter04 old) => old.t != t;
}

class _DotGridPainter04 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.038)
      ..style = PaintingStyle.fill;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter04 _) => false;
}