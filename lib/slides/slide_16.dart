import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 16 – AI în Dezvoltarea Aplicațiilor & Concluzie
// ─────────────────────────────────────────────────────────────────────────────

class Slide14AIConcluzie extends StatefulWidget {
  const Slide14AIConcluzie({super.key});
  @override
  State<Slide14AIConcluzie> createState() => _S16State();
}

class _S16State extends State<Slide14AIConcluzie>
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

  static const _aiDomains = [
    _AIDomain(
      icon: Icons.auto_graph_rounded,
      label: 'Machine Learning',
      color: Color(0xFF00F0FF),
      desc:
      'Algoritmii ML permit aplicațiilor să "învețe" din date fără a fi programate explicit. Utilizați în filtrarea spam-ului, detectarea fraudelor, recomandări de produse și recunoașterea imaginilor.',
    ),
    _AIDomain(
      icon: Icons.chat_bubble_outline_rounded,
      label: 'Natural Language Processing',
      color: Color(0xFF00FF88),
      desc:
      'NLP permite aplicațiilor să înțeleagă și să genereze text uman. Stă la baza chatbot-urilor, asistenților virtuali (Siri, Google Assistant, Alexa) și a traducătorilor automați.',
    ),
    _AIDomain(
      icon: Icons.remove_red_eye_outlined,
      label: 'Computer Vision',
      color: Color(0xFF90D8FF),
      desc:
      'Permite aplicațiilor să "vadă" și să interpreteze imagini și video. Utilizat în recunoașterea facială, aplicații medicale pentru diagnosticare, mașini autonome și filtre pentru rețele sociale.',
    ),
    _AIDomain(
      icon: Icons.auto_awesome_outlined,
      label: 'AI Generativă',
      color: Color(0xFFFF6BFF),
      desc:
      'Modelele mari de limbaj (LLM) — GPT-4, Claude, Gemini — pot genera text, cod, imagini și audio. Integrate în aplicații ca GitHub Copilot, generatoare de conținut și instrumente creative.',
    ),
  ];

  static const _conclusionPoints = [
    _ConclusionPoint(
      icon: Icons.people_outline_rounded,
      text: 'Crearea unei aplicații înseamnă să înțelegi oamenii pentru care o construiești.',
      color: Color(0xFF00F0FF),
    ),
    _ConclusionPoint(
      icon: Icons.architecture_rounded,
      text: 'Un plan bine scris, un design gândit și o arhitectură aleasă cu cap îți vor salva săptămâni întregi.',
      color: Color(0xFF00FF88),
    ),
    _ConclusionPoint(
      icon: Icons.loop_rounded,
      text: 'Nu o să iasă totul perfect din prima. Conversația cu utilizatorii este esențială pentru găsirea erorilor.',
      color: Color(0xFF90D8FF),
    ),
    _ConclusionPoint(
      icon: Icons.insights_rounded,
      text: 'O aplicație bună nu se măsoară în linii de cod — se măsoară în cât de mult îi ajută pe cei care o folosesc.',
      color: Color(0xFFFFCC00),
    ),
    _ConclusionPoint(
      icon: Icons.cloud_outlined,
      text: 'Google Cloud oferă autentificare, bază de date, stocare și hosting — tot ce ai nevoie pentru a lansa ceva real.',
      color: Color(0xFFFF6BFF),
    ),
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
      key: const ValueKey('slide_14'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter16(), size: Size.infinite),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _ParticlePainter14(_ctrl.value),
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
                const Color(0xFFFF6BFF).withOpacity(0.09),
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
                const Color(0xFF00F0FF).withOpacity(0.09),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(72, 32, 72, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── HEADER ──────────────────────────────────────────────────
              Row(children: [
                Container(width: 56, height: 4,
                    color: const Color(0xFFFF6BFF)),
                const SizedBox(width: 16),
                const Text('14', style: TextStyle(
                  color: Color(0xFFFF6BFF), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFFFF6BFF).withOpacity(0.5)),
                const SizedBox(width: 10),
                Text('AI · CONCLUZIE',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 10),

              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Colors.white, Color(0xFFFF6BFF)],
                ).createShader(b),
                child: const Text(
                  'AI & Concluzie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    letterSpacing: -2.0,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 900.ms, delay: 200.ms)
                  .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

              const SizedBox(height: 6),

              Text(
                'Inteligența Artificială a transformat radical modul în care aplicațiile sunt concepute, dezvoltate și utilizate.',
                style: TextStyle(
                  color: const Color(0xFFFF6BFF).withOpacity(0.75),
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.8,
                ),
              ).animate().fadeIn(duration: 700.ms, delay: 450.ms),

              const SizedBox(height: 18),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── STÂNGA: Domenii AI (2x2 grid) ────────────────────
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Container(width: 3, height: 14,
                                color: const Color(0xFFFF6BFF)),
                            const SizedBox(width: 10),
                            const Text('INTELIGENȚĂ ARTIFICIALĂ ÎN APLICAȚII',
                                style: TextStyle(
                                  color: Color(0xFFFF6BFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 2,
                                )),
                          ]),
                          const SizedBox(height: 12),
                          Expanded(
                            child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.6,
                              ),
                              itemCount: _aiDomains.length,
                              itemBuilder: (context, i) {
                                final d = _aiDomains[i];
                                return _AIDomainCard(domain: d)
                                    .animate()
                                    .fadeIn(duration: 550.ms, delay: Duration(milliseconds: 300 + i * 100))
                                    .slideY(begin: 0.08, end: 0, duration: 500.ms, delay: Duration(milliseconds: 300 + i * 100));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 28),

                    // ── DREAPTA: Concluzie ────────────────────────────────
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00F0FF).withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF00F0FF).withOpacity(0.22),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(Icons.lightbulb_outline_rounded,
                                  color: Color(0xFFFFCC00), size: 22),
                              const SizedBox(width: 10),
                              const Text('CONCLUZIE',
                                  style: TextStyle(
                                    color: Color(0xFFFFCC00),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 3,
                                  )),
                            ]),
                            const SizedBox(height: 16),
                            Expanded(
                              child: Column(
                                children: List.generate(_conclusionPoints.length, (i) {
                                  final c = _conclusionPoints[i];
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: i < _conclusionPoints.length - 1 ? 10 : 0),
                                      child: _ConclusionCard(point: c)
                                          .animate()
                                          .fadeIn(duration: 500.ms, delay: Duration(milliseconds: 400 + i * 100))
                                          .slideX(begin: 0.06, end: 0, duration: 450.ms, delay: Duration(milliseconds: 400 + i * 100)),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
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
                    const Color(0xFFFF6BFF).withOpacity(
                        0.75 + 0.25 * math.sin(_ctrl.value * 2 * math.pi)),
                    const Color(0xFF00F0FF).withOpacity(0.65),
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

// ── Data classes ──────────────────────────────────────────────────────────────

class _AIDomain {
  final IconData icon;
  final String label;
  final Color color;
  final String desc;
  const _AIDomain({required this.icon, required this.label, required this.color, required this.desc});
}

class _ConclusionPoint {
  final IconData icon;
  final String text;
  final Color color;
  const _ConclusionPoint({required this.icon, required this.text, required this.color});
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _AIDomainCard extends StatelessWidget {
  final _AIDomain domain;
  const _AIDomainCard({required this.domain});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: domain.color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: domain.color.withOpacity(0.22), width: 1),
        boxShadow: [
          BoxShadow(
            color: domain.color.withOpacity(0.05),
            blurRadius: 16,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: domain.color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(domain.icon, color: domain.color, size: 20),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(domain.label, style: TextStyle(
                color: domain.color,
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                height: 1.2,
              )),
            ),
          ]),
          const SizedBox(height: 10),
          Expanded(
            child: Text(domain.desc, style: TextStyle(
              color: Colors.white.withOpacity(0.68),
              fontSize: 12.5,
              height: 1.45,
            ), overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }
}

class _ConclusionCard extends StatelessWidget {
  final _ConclusionPoint point;
  const _ConclusionCard({required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: point.color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: point.color.withOpacity(0.22), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: point.color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(point.icon, color: point.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(point.text, style: TextStyle(
              color: Colors.white.withOpacity(0.80),
              fontSize: 13,
              height: 1.4,
            )),
          ),
        ],
      ),
    );
  }
}


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

class _ParticlePainter14 extends CustomPainter {
  final double t;
  _ParticlePainter14(this.t);

  static const _c1 = Color(0xFFFF6BFF);
  static const _c2 = Color(0xFF00F0FF);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _S16State._particles) {
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
  bool shouldRepaint(_ParticlePainter14 old) => old.t != t;
}
class _DotGridPainter16 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter16 _) => false;
}