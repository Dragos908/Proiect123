import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 12 – Arhitectura & Baze de Date  (fully responsive)
// ─────────────────────────────────────────────────────────────────────────────

class Slide12Arhitectura extends StatefulWidget {
  const Slide12Arhitectura({super.key});
  @override
  State<Slide12Arhitectura> createState() => _S14State();
}

class _S14State extends State<Slide12Arhitectura>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  static const _particles = [
    _Particle(x:0.5,  y:0.95, speedX:0.10, speedY:0.02, amplitude:0.020, phase:0.0, radius:1.5, opacity:0.06, pulseSpeed:0.30, useColor2:true),
    _Particle(x:0.804,y:0.168,speedX:0.18, speedY:0.03, amplitude:0.035, phase:0.4, radius:2.3, opacity:0.10, pulseSpeed:0.45, useColor2:false),
    _Particle(x:0.052,y:0.538,speedX:0.26, speedY:0.04, amplitude:0.050, phase:0.8, radius:3.1, opacity:0.14, pulseSpeed:0.60, useColor2:false),
    _Particle(x:0.856,y:0.775,speedX:0.34, speedY:0.05, amplitude:0.065, phase:1.2, radius:3.9, opacity:0.18, pulseSpeed:0.75, useColor2:true),
    _Particle(x:0.423,y:0.057,speedX:0.42, speedY:0.06, amplitude:0.020, phase:1.6, radius:4.7, opacity:0.06, pulseSpeed:0.90, useColor2:false),
    _Particle(x:0.257,y:0.879,speedX:0.50, speedY:0.02, amplitude:0.035, phase:2.0, radius:1.5, opacity:0.10, pulseSpeed:1.05, useColor2:false),
    _Particle(x:0.935,y:0.386,speedX:0.58, speedY:0.03, amplitude:0.050, phase:2.4, radius:2.3, opacity:0.14, pulseSpeed:0.30, useColor2:true),
    _Particle(x:0.102,y:0.290,speedX:0.10, speedY:0.04, amplitude:0.065, phase:2.8, radius:3.1, opacity:0.18, pulseSpeed:0.45, useColor2:false),
    _Particle(x:0.651,y:0.924,speedX:0.18, speedY:0.05, amplitude:0.020, phase:3.2, radius:3.9, opacity:0.06, pulseSpeed:0.60, useColor2:false),
    _Particle(x:0.675,y:0.086,speedX:0.26, speedY:0.06, amplitude:0.035, phase:3.6, radius:4.7, opacity:0.10, pulseSpeed:0.75, useColor2:true),
    _Particle(x:0.091,y:0.687,speedX:0.34, speedY:0.02, amplitude:0.050, phase:4.0, radius:1.5, opacity:0.14, pulseSpeed:0.90, useColor2:false),
    _Particle(x:0.928,y:0.639,speedX:0.42, speedY:0.03, amplitude:0.065, phase:4.4, radius:2.3, opacity:0.18, pulseSpeed:1.05, useColor2:false),
    _Particle(x:0.279,y:0.108,speedX:0.50, speedY:0.04, amplitude:0.020, phase:4.8, radius:3.1, opacity:0.06, pulseSpeed:0.30, useColor2:true),
    _Particle(x:0.398,y:0.938,speedX:0.58, speedY:0.05, amplitude:0.035, phase:5.2, radius:3.9, opacity:0.10, pulseSpeed:0.45, useColor2:false),
    _Particle(x:0.872,y:0.246,speedX:0.10, speedY:0.06, amplitude:0.050, phase:5.6, radius:4.7, opacity:0.14, pulseSpeed:0.60, useColor2:false),
    _Particle(x:0.055,y:0.436,speedX:0.18, speedY:0.02, amplitude:0.065, phase:6.0, radius:1.5, opacity:0.18, pulseSpeed:0.75, useColor2:true),
    _Particle(x:0.785,y:0.849,speedX:0.26, speedY:0.03, amplitude:0.020, phase:6.4, radius:2.3, opacity:0.06, pulseSpeed:0.90, useColor2:false),
    _Particle(x:0.526,y:0.051,speedX:0.34, speedY:0.04, amplitude:0.035, phase:6.8, radius:3.1, opacity:0.10, pulseSpeed:1.05, useColor2:false),
    _Particle(x:0.177,y:0.813,speedX:0.42, speedY:0.05, amplitude:0.050, phase:7.2, radius:3.9, opacity:0.14, pulseSpeed:0.30, useColor2:true),
    _Particle(x:0.950,y:0.487,speedX:0.50, speedY:0.06, amplitude:0.065, phase:7.6, radius:4.7, opacity:0.18, pulseSpeed:0.45, useColor2:false),
    _Particle(x:0.160,y:0.205,speedX:0.58, speedY:0.02, amplitude:0.020, phase:8.0, radius:1.5, opacity:0.06, pulseSpeed:0.60, useColor2:false),
    _Particle(x:0.551,y:0.947,speedX:0.10, speedY:0.03, amplitude:0.035, phase:8.4, radius:2.3, opacity:0.10, pulseSpeed:0.75, useColor2:true),
  ];

  static const _dbItems = [
    _DbItem(
      name: 'PostgreSQL',
      type: 'SQL',
      typeColor: Color(0xFF00F0FF),
      desc: 'Ideal pentru date financiare, medicale, e-commerce. Prima alegere recomandată.',
    ),
    _DbItem(
      name: 'MySQL / MariaDB',
      type: 'SQL',
      typeColor: Color(0xFF00F0FF),
      desc: 'Performanță excelentă pentru citire grea. Ecosistem matur.',
    ),
    _DbItem(
      name: 'MongoDB',
      type: 'NoSQL',
      typeColor: Color(0xFF00FF88),
      desc: 'Schemă flexibilă. Ideal pentru faze timpurii cu schemă în schimbare rapidă.',
    ),
    _DbItem(
      name: 'Redis',
      type: 'In-Memory',
      typeColor: Color(0xFFFFCC00),
      desc: 'Latență sub 1ms. Ideal pentru caching, sesiuni, rate limiting, leaderboards.',
    ),
    _DbItem(
      name: 'Cassandra',
      type: 'NoSQL',
      typeColor: Color(0xFF00FF88),
      desc: 'Scrieri masive, disponibilitate ridicată, distribuție multi-region. Netflix, Instagram.',
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
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        // ── Scale factor: baseline 1440×900 ──────────────────────────────
        final scale = (w / 1440.0).clamp(0.45, 1.2);
        final hScale = (h / 900.0).clamp(0.45, 1.2);
        final s = math.min(scale, hScale);

        // ── Derived sizes ─────────────────────────────────────────────────
        final hPad   = (w * 0.05).clamp(16.0, 72.0);
        final vPad   = (h * 0.035).clamp(12.0, 32.0);
        final gap    = (16 * s).clamp(6.0, 20.0);
        final gap2   = (24 * s).clamp(8.0, 24.0);

        return Container(
          key: const ValueKey('slide_12'),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
            ),
          ),
          child: Stack(children: [
            // ── Background decorations ─────────────────────────────────────
            CustomPaint(painter: _DotGridPainter14(), size: Size.infinite),
            AnimatedBuilder(
              animation: _ctrl,
              builder: (_, __) => CustomPaint(
                painter: _ParticlePainter12(_ctrl.value),
                size: Size.infinite,
              ),
            ),
            Positioned(
              top: -120, right: -80,
              child: Container(
                width: 560, height: 560,
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
              bottom: -100, left: 60,
              child: Container(
                width: 420, height: 420,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [
                    const Color(0xFFFFCC00).withOpacity(0.07),
                    Colors.transparent,
                  ]),
                ),
              ),
            ),

            // ── Main content ───────────────────────────────────────────────
            Padding(
              padding: EdgeInsets.fromLTRB(hPad, vPad, hPad, vPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── HEADER ──────────────────────────────────────────────
                  Row(children: [
                    Container(width: 56 * s, height: 4, color: const Color(0xFF00F0FF)),
                    SizedBox(width: 16 * s),
                    Text('12', style: TextStyle(
                      color: const Color(0xFF00F0FF),
                      fontSize: (18 * s).clamp(11, 18),
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4,
                    )),
                    SizedBox(width: 10 * s),
                    Container(
                      width: 1, height: 18 * s,
                      color: const Color(0xFF00F0FF).withOpacity(0.4),
                    ),
                    SizedBox(width: 10 * s),
                    Text('ARHITECTURA · BAZE DE DATE',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.42),
                          fontSize: (16 * s).clamp(10, 16),
                          letterSpacing: 3,
                        )),
                  ]).animate().fadeIn(duration: 500.ms),

                  SizedBox(height: gap * 0.6),

                  // ── TITLE ──────────────────────────────────────────────
                  ShaderMask(
                    shaderCallback: (b) => const LinearGradient(
                      colors: [Colors.white, Color(0xFF90D8FF)],
                    ).createShader(b),
                    child: Text(
                      'Arhitectura & Tehnologia',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (72 * s).clamp(28, 72),
                        fontWeight: FontWeight.w900,
                        height: 1.05,
                        letterSpacing: -2.0 * s,
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms, delay: 200.ms)
                      .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

                  SizedBox(height: gap * 0.4),

                  // ── SUBTITLE ───────────────────────────────────────────
                  Text(
                    'Arhitectura software este planul structural al unui sistem — '
                    'modul în care componentele majore sunt organizate și cum comunică între ele.',
                    style: TextStyle(
                      color: const Color(0xFF00F0FF).withOpacity(0.72),
                      fontSize: (17 * s).clamp(11, 17),
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.8,
                    ),
                  ).animate().fadeIn(duration: 700.ms, delay: 450.ms),

                  SizedBox(height: gap),

                  // ── THREE COLUMNS ──────────────────────────────────────
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        // Left: Monolitic
                        Expanded(
                          child: _ArchCard(
                            delay: 300,
                            accentColor: const Color(0xFF00F0FF),
                            icon: Icons.view_compact_rounded,
                            title: 'Arhitectură Monolitică',
                            subtitle: 'O singură unitate · Ideal pentru startupuri',
                            description:
                              'Un monolit este o aplicație în care toate componentele funcționale '
                              'sunt construite, testate și puse ca o singură unitate. Este o alegere '
                              'excelentă pentru startupuri în fazele timpurii și echipe mici.',
                            noteText:
                              'Stack Overflow a rulat pe un monolit mulți ani. '
                              'Scalabilitatea nu necesită neapărat microservicii.',
                            features: const [
                              _Feature('Simplicitate operațională', Icons.check_circle_outline),
                              _Feature('Latență redusă intern',     Icons.check_circle_outline),
                              _Feature('Tranzacții ACID simple',    Icons.check_circle_outline),
                              _Feature('Debugging accesibil',       Icons.check_circle_outline),
                            ],
                            featureColor: const Color(0xFF00F0FF),
                            scale: s,
                          ),
                        ),

                        SizedBox(width: gap2),

                        // Middle: Microservicii
                        Expanded(
                          child: _ArchCard(
                            delay: 480,
                            accentColor: const Color(0xFF00FF88),
                            icon: Icons.account_tree_rounded,
                            title: 'Arhitectură Microservicii',
                            subtitle: 'Servicii independente · Scala mare',
                            description:
                              'Microserviciile structurează aplicația ca o colecție de servicii mici, '
                              'independente, fiecare responsabil de o capacitate de business bine delimitată.',
                            noteText:
                              'Beneficiile sunt maxime la scală mare. Costurile reale: complexitate '
                              'operațională, latență prin rețea, dificultatea tranzacțiilor distribuite.',
                            features: const [
                              _Feature('Scalabilitate independentă', Icons.check_circle_outline),
                              _Feature('Reziliență crescută',        Icons.check_circle_outline),
                              _Feature('Libertate tehnologică',      Icons.check_circle_outline),
                              _Feature('Deploy independent',         Icons.check_circle_outline),
                            ],
                            featureColor: const Color(0xFF00FF88),
                            scale: s,
                          ),
                        ),

                        SizedBox(width: gap2),

                        // Right: Baze de date
                        Expanded(
                          child: _DbColumn(
                            items: _S14State._dbItems,
                            scale: s,
                          )
                              .animate()
                              .fadeIn(duration: 700.ms, delay: 600.ms)
                              .slideY(begin: 0.06, end: 0, duration: 600.ms, delay: 600.ms),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Neon strip left ────────────────────────────────────────────
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
                          0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi),
                        ),
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
      },
    );
  }
}

// ── Extracted DB column widget ─────────────────────────────────────────────────

class _DbColumn extends StatelessWidget {
  final List<_DbItem> items;
  final double scale;
  const _DbColumn({required this.items, required this.scale});

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Container(
      padding: EdgeInsets.all((24 * s).clamp(10, 24)),
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC00).withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFFFCC00).withOpacity(0.25),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(Icons.storage_rounded,
                color: const Color(0xFFFFCC00), size: (28 * s).clamp(16, 28)),
            SizedBox(width: 12 * s),
            Flexible(
              child: Text(
                'Baze de Date\nSQL vs NoSQL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: (20 * s).clamp(12, 20),
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
            ),
          ]),
          SizedBox(height: (18 * s).clamp(8, 18)),
          Expanded(
            child: Column(
              children: List.generate(items.length, (i) {
                final db = items[i];
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: i < items.length - 1 ? (10 * s).clamp(4, 10) : 0),
                    child: _DbCard(item: db, scale: s)
                        .animate()
                        .fadeIn(
                            duration: 500.ms,
                            delay: Duration(milliseconds: 600 + i * 80))
                        .slideX(
                            begin: 0.06,
                            end: 0,
                            duration: 450.ms,
                            delay: Duration(milliseconds: 600 + i * 80)),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Data classes ───────────────────────────────────────────────────────────────

class _Feature {
  final String label;
  final IconData icon;
  const _Feature(this.label, this.icon);
}

class _DbItem {
  final String name;
  final String type;
  final Color typeColor;
  final String desc;
  const _DbItem({
    required this.name,
    required this.type,
    required this.typeColor,
    required this.desc,
  });
}

// ── _ArchCard ──────────────────────────────────────────────────────────────────

class _ArchCard extends StatelessWidget {
  final int delay;
  final Color accentColor;
  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final String noteText;
  final List<_Feature> features;
  final Color featureColor;
  final double scale;

  const _ArchCard({
    required this.delay,
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.noteText,
    required this.features,
    required this.featureColor,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final pad = (24 * s).clamp(10.0, 24.0);

    return Container(
      padding: EdgeInsets.all(pad),
      decoration: BoxDecoration(
        color: accentColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor.withOpacity(0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon + title
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(icon, color: accentColor, size: (28 * s).clamp(16, 28)),
            SizedBox(width: 12 * s),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: (19 * s).clamp(11, 19),
                        fontWeight: FontWeight.w800,
                      )),
                  SizedBox(height: 2 * s),
                  Text(subtitle,
                      style: TextStyle(
                        color: accentColor.withOpacity(0.75),
                        fontSize: (12 * s).clamp(8, 12),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      )),
                ],
              ),
            ),
          ]),
          SizedBox(height: (16 * s).clamp(6, 16)),

          // Description
          Text(description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.80),
                fontSize: (14.5 * s).clamp(9, 14.5),
                height: 1.5,
              )),
          SizedBox(height: (12 * s).clamp(5, 12)),

          // Note box
          Container(
            padding: EdgeInsets.all((12 * s).clamp(6, 12)),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.07),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: accentColor.withOpacity(0.18)),
            ),
            child: Text(noteText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.70),
                  fontSize: (13 * s).clamp(8, 13),
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                )),
          ),
          SizedBox(height: (16 * s).clamp(6, 16)),

          // "AVANTAJE CHEIE" label
          Text('AVANTAJE CHEIE',
              style: TextStyle(
                color: accentColor,
                fontSize: (11 * s).clamp(7, 11),
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              )),
          SizedBox(height: (10 * s).clamp(4, 10)),

          // Feature list — flexible so it never overflows
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: features
                  .map((f) => Padding(
                        padding: EdgeInsets.only(bottom: (8 * s).clamp(3, 8)),
                        child: Row(children: [
                          Icon(f.icon, color: featureColor, size: (16 * s).clamp(10, 16)),
                          SizedBox(width: 10 * s),
                          Expanded(
                            child: Text(f.label,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: (13.5 * s).clamp(9, 13.5),
                                )),
                          ),
                        ]),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 700.ms, delay: Duration(milliseconds: delay))
        .slideY(begin: 0.06, end: 0, duration: 600.ms, delay: Duration(milliseconds: delay));
  }
}

// ── _DbCard ────────────────────────────────────────────────────────────────────

class _DbCard extends StatelessWidget {
  final _DbItem item;
  final double scale;
  const _DbCard({required this.item, required this.scale});

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (14 * s).clamp(8, 14),
        vertical:   (10 * s).clamp(5, 10),
      ),
      decoration: BoxDecoration(
        color: item.typeColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: item.typeColor.withOpacity(0.22), width: 1),
      ),
      child: Row(
        children: [
          // Type badge
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: (8 * s).clamp(4, 8),
              vertical:   (4 * s).clamp(2, 4),
            ),
            decoration: BoxDecoration(
              color: item.typeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: item.typeColor.withOpacity(0.4)),
            ),
            child: Text(item.type,
                style: TextStyle(
                  color: item.typeColor,
                  fontSize: (10 * s).clamp(7, 10),
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                )),
          ),
          SizedBox(width: 12 * s),
          // Name + description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: (13.5 * s).clamp(9, 13.5),
                      fontWeight: FontWeight.w700,
                    )),
                SizedBox(height: 2 * s),
                Flexible(
                  child: Text(item.desc,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.60),
                        fontSize: (12 * s).clamp(8, 12),
                        height: 1.3,
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Particle system ────────────────────────────────────────────────────────────

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

class _ParticlePainter12 extends CustomPainter {
  final double t;
  _ParticlePainter12(this.t);

  static const _c1 = Color(0xFF00F0FF);
  static const _c2 = Color(0xFFFFCC00);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _S14State._particles) {
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
  bool shouldRepaint(_ParticlePainter12 old) => old.t != t;
}

class _DotGridPainter14 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.04)
      ..style = PaintingStyle.fill;
    const step = 32.0;
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step) {
        canvas.drawCircle(Offset(x, y), 1.4, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter14 _) => false;
}