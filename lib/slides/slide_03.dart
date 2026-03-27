import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 03 – Istoricul Aplicațiilor
// ─────────────────────────────────────────────────────────────────────────────

class Slide03History extends StatefulWidget {
  const Slide03History({super.key});
  @override
  State<Slide03History> createState() => _S03State();
}

class _S03State extends State<Slide03History>
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
      key: const ValueKey('slide_03'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter03(), size: Size.infinite),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _ParticlePainter03(_ctrl.value),
            size: Size.infinite,
          ),
        ),

        // Glow orb top-right
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
        // Glow orb bottom-left
        Positioned(
          bottom: -100, left: 60,
          child: Container(
            width: 420, height: 420,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00FF88).withOpacity(0.09),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(72, 36, 72, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER ─────────────────────────────────────────────────────
              Row(children: [
                Container(width: 56, height: 4, color: const Color(0xFF00F0FF)),
                const SizedBox(width: 16),
                const Text('03', style: TextStyle(
                  color: Color(0xFF00F0FF), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFF00F0FF).withOpacity(0.4)),
                const SizedBox(width: 10),
                Text('ORIGINI · TEORIE · PRIMĂ EXECUȚIE',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 14),

              // ── TITLU ──────────────────────────────────────────────────────
              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Colors.white, Color(0xFF90D8FF)],
                ).createShader(b),
                child: const Text(
                  'Istoricul Aplicațiilor',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 86,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    letterSpacing: -2.0,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 900.ms, delay: 200.ms)
                  .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

              const SizedBox(height: 8),

              // Intro sentence
              Text(
                'De la cartele perforate la milioane de aplicații în buzunarul fiecăruia dintre noi.',
                style: TextStyle(
                  color: const Color(0xFF00F0FF).withOpacity(0.78),
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5,
                ),
              ).animate().fadeIn(duration: 700.ms, delay: 500.ms),

              const SizedBox(height: 28),

              // ── DOUĂ COLOANE ───────────────────────────────────────────────
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── COLOANA STÂNGA: Fundamentul Teoretic ──────────────
                    Expanded(
                      child: _HistoryCard(
                        delay: 300,
                        year: '1843',
                        accentColor: const Color(0xFF00F0FF),
                        badgeLabel: 'FUNDAMENT TEORETIC',
                        title: 'Ada Lovelace &\nMașina Analitică',
                        bodyText:
                        'Înainte ca orice computer electronic să existe, matematiciana Ada Lovelace a pus bazele teoretice ale programării. Lucrând la Mașina Analitică proiectată de Charles Babbage, ea a redactat primul algoritm destinat execuției automate — un proces recursiv pentru calcularea numerelor lui Bernoulli, incluzând bucle de repetiție, acces la memorie și salturi condiționate.\n\nLovelace a intuit că o mașină poate manipula simboluri conform unor reguli logice, nu doar efectua calcule aritmetice, punând astfel fundamentul întregii discipline.',
                        imageName: '02.jpg', // <--- SCHIMBĂ NUMELE AICI
                      ),
                    ),

                    const SizedBox(width: 28),

                    // ── COLOANA DREAPTA: Prima Execuție Fizică ─────────────
                    Expanded(
                      child: _HistoryCard(
                        delay: 500,
                        year: '1948',
                        accentColor: const Color(0xFF00FF88),
                        badgeLabel: 'PRIMA EXECUȚIE FIZICĂ',
                        title: 'Tom Kilburn &\nManchester Baby',
                        bodyText:
                        'Teoria a devenit realitate pe 21 iunie 1948, când Tom Kilburn a rulat primul program software din istorie pe computerul SSEM — „Manchester Baby" — la Universitatea din Manchester. Scopul: găsirea celui mai mare divizor propriu al numărului 2¹⁸ (262.144).\n\nExecuția a durat 52 de minute și a implicat ~3,5 milioane de operațiuni. Inovația esențială a fost memoria cu acces aleatoriu, care permitea stocarea instrucțiunilor alături de date, eliminând reconfigurarea fizică pentru fiecare sarcină.',
                        imageName: '03.png', // <--- SCHIMBĂ NUMELE AICI
                      ),
                    ),
                  ],
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

// ── CARD COMPONENT ────────────────────────────────────────────────────────────
class _HistoryCard extends StatelessWidget {
  final int delay;
  final String year;
  final Color accentColor;
  final String badgeLabel;
  final String title;
  final String bodyText;
  final String imageName; // <-- Am schimbat din photoHint în imageName

  const _HistoryCard({
    required this.delay,
    required this.year,
    required this.accentColor,
    required this.badgeLabel,
    required this.title,
    required this.bodyText,
    required this.imageName,
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
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.06),
            blurRadius: 30,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Year badge + label row
          Row(children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: accentColor.withOpacity(0.5)),
              ),
              child: Text(year, style: TextStyle(
                color: accentColor,
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              )),
            ),
            const SizedBox(width: 14),
            Flexible(
              child: Text(badgeLabel, style: TextStyle(
                color: accentColor.withOpacity(0.65),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.5,
              )),
            ),
          ]),

          const SizedBox(height: 16),

          // Title
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w800,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 18),

          // ── IMAGINEA MĂRITĂ ȘI COMPLETĂ ──────────────────────────────────────
          Container(
            height: 280, // <-- AM MĂRIT ÎNĂLȚIMEA IMAGINII SEMNIFICATIV (înainte era 175)
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: accentColor.withOpacity(0.35),
                width: 1.5,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(11), // Rază de rotunjire pentru a nu ieși din margini
              child: Image.asset(
                'assets/images/$imageName', // <-- Preia automat numele introdus mai sus
                fit: BoxFit.cover, // Asigură că imaginea umple tot spațiul
                width: double.infinity,
              ),
            ),
          ),

          const SizedBox(height: 18),

          // Body text – scrollable in case of overflow
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                bodyText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.82),
                  fontSize: 15.5,
                  height: 1.55,
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
        .slideY(begin: 0.06, end: 0, duration: 600.ms,
        delay: Duration(milliseconds: delay));
  }
}

// ── DOT GRID ──────────────────────────────────────────────────────────────────

// ── PARTICLE SYSTEM ───────────────────────────────────────────────────────────

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

class _ParticlePainter03 extends CustomPainter {
  final double t;
  _ParticlePainter03(this.t);

  static const _c1 = Color(0xFF00F0FF);
  static const _c2 = Color(0xFF00FF88);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _S03State._particles) {
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
  bool shouldRepaint(_ParticlePainter03 old) => old.t != t;
}
class _DotGridPainter03 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter03 _) => false;
}