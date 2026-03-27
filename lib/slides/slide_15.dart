import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 15 – Etapa 5: Securitatea Aplicației — STRIDE & OWASP Top 10
// ─────────────────────────────────────────────────────────────────────────────

class Slide13Securitate extends StatefulWidget {
  const Slide13Securitate({super.key});
  @override
  State<Slide13Securitate> createState() => _S15State();
}

class _S15State extends State<Slide13Securitate>
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

  static const _strideItems = [
    _StrideItem('S', 'Spoofing', 'Falsificarea identității',
        'Autentificare puternică, certificate TLS, MFA'),
    _StrideItem('T', 'Tampering', 'Modificarea neautorizată a datelor',
        'Semnături digitale, HMAC, validare input strict'),
    _StrideItem('R', 'Repudiation', 'Negarea acțiunilor efectuate',
        'Audit logs imutabile, semnături tranzacții'),
    _StrideItem('I', 'Information Disclosure', 'Expunerea datelor sensibile',
        'Criptare end-to-end, minimizare date, RBAC'),
    _StrideItem('D', 'Denial of Service', 'Indisponibilizarea serviciului',
        'Rate limiting, WAF, auto-scaling, CDN'),
    _StrideItem('E', 'Elevation of Privilege', 'Acces neautorizat la resurse',
        'Principiul least privilege, validare roluri'),
  ];

  static const _owaspItems = [
    _OwaspItem('A01', 'Broken Access Control',
        'Utilizatorii acționează în afara permisiunilor. Prevenire: RBAC strict, testare automată.'),
    _OwaspItem('A02', 'Cryptographic Failures',
        'Date sensibile expuse prin criptare slabă. Prevenire: AES-256, TLS 1.3.'),
    _OwaspItem('A03', 'Injection (SQL, OS)',
        'Cod malițios prin input nevalidat. Prevenire: ORM, prepared statements.'),
    _OwaspItem('A04', 'Insecure Design',
        'Lipsa controalelor de securitate la nivel arhitectural. Prevenire: threat modeling.'),
    _OwaspItem('A05', 'Security Misconfiguration',
        'Configurări default nesigure. Prevenire: hardening, IaC cu security policies.'),
    _OwaspItem('A06', 'Vulnerable Components',
        'Dependențe cu vulnerabilități cunoscute. Prevenire: Snyk, Dependabot.'),
    _OwaspItem('A07', 'Auth Failures',
        'Slăbiciuni în autentificare și sesiuni. Prevenire: MFA, secure session management.'),
    _OwaspItem('A08', 'Data Integrity Failures',
        'Deserializare nesigură, CI/CD compromis. Prevenire: verificare semnături.'),
    _OwaspItem('A09', 'Logging Failures',
        'Lipsa monitorizării pentru detecția atacurilor. Prevenire: SIEM, alerting.'),
    _OwaspItem('A10', 'SSRF',
        'Server-side request forgery. Prevenire: validare URL, allowlist rețele interne.'),
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
      key: const ValueKey('slide_13'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter15(), size: Size.infinite),
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => CustomPaint(
            painter: _ParticlePainter13(_ctrl.value),
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
                const Color(0xFFFF0055).withOpacity(0.09),
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
                const Color(0xFF00FF88).withOpacity(0.08),
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
                Container(width: 56, height: 4, color: const Color(0xFFFF0055)),
                const SizedBox(width: 16),
                const Text('13', style: TextStyle(
                  color: Color(0xFFFF0055), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFFFF0055).withOpacity(0.5)),
                const SizedBox(width: 10),
                Text('SECURITY BY DESIGN · SHIFT LEFT',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (b) => const LinearGradient(
                      colors: [Colors.white, Color(0xFFFF8090)],
                    ).createShader(b),
                    child: const Text(
                      'Securitatea Aplicației',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 72,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        letterSpacing: -2.0,
                      ),
                    ),
                  ).animate().fadeIn(duration: 900.ms, delay: 200.ms)
                      .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

                  const Spacer(),

                  // KPI
                  Row(children: [
                    _SecKpi(value: '\$4.88M', label: 'Cost mediu\nbreach 2024', color: const Color(0xFFFF0055)),
                    const SizedBox(width: 14),
                    _SecKpi(value: '4%', label: 'Amenda GDPR\ndin cifra anuală', color: const Color(0xFFFFCC00)),
                  ]).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                'Securitatea nu este opțională — este o proprietate fundamentală. Costul remedierii crește exponențial: o problemă în cod costă minute, aceeași problemă în producție poate costa săptămâni.',
                style: TextStyle(
                  color: const Color(0xFFFF0055).withOpacity(0.75),
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  height: 1.4,
                ),
              ).animate().fadeIn(duration: 700.ms, delay: 450.ms),

              const SizedBox(height: 16),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── COLOANA STÂNGA: STRIDE ───────────────────────────
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
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
                              const Icon(Icons.shield_outlined,
                                  color: Color(0xFFFFCC00), size: 22),
                              const SizedBox(width: 10),
                              const Text('MODEL STRIDE — THREAT MODELING',
                                  style: TextStyle(
                                    color: Color(0xFFFFCC00),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                  )),
                            ]),
                            const SizedBox(height: 14),
                            Expanded(
                              child: Column(
                                children: List.generate(_strideItems.length, (i) {
                                  final s = _strideItems[i];
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: i < _strideItems.length - 1 ? 8 : 0),
                                      child: _StrideCard(item: s)
                                          .animate()
                                          .fadeIn(duration: 450.ms, delay: Duration(milliseconds: 300 + i * 70))
                                          .slideX(begin: -0.05, end: 0, duration: 400.ms, delay: Duration(milliseconds: 300 + i * 70)),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 24),

                    // ── COLOANA DREAPTA: OWASP Top 10 ───────────────────
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF0055).withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFFF0055).withOpacity(0.25),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(Icons.bug_report_outlined,
                                  color: Color(0xFFFF0055), size: 22),
                              const SizedBox(width: 10),
                              const Text('OWASP TOP 10 — VULNERABILITĂȚI CRITICE',
                                  style: TextStyle(
                                    color: Color(0xFFFF0055),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                  )),
                            ]),
                            const SizedBox(height: 14),
                            Expanded(
                              child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: _owaspItems.length,
                                separatorBuilder: (_, __) => const SizedBox(height: 7),
                                itemBuilder: (context, i) {
                                  final o = _owaspItems[i];
                                  return _OwaspCard(item: o)
                                      .animate()
                                      .fadeIn(duration: 450.ms, delay: Duration(milliseconds: 350 + i * 65))
                                      .slideX(begin: 0.05, end: 0, duration: 400.ms, delay: Duration(milliseconds: 350 + i * 65));
                                },
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
                    const Color(0xFFFF0055).withOpacity(
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

// ── Data classes ──────────────────────────────────────────────────────────────

class _StrideItem {
  final String letter;
  final String name;
  final String threat;
  final String prevention;
  const _StrideItem(this.letter, this.name, this.threat, this.prevention);
}

class _OwaspItem {
  final String code;
  final String name;
  final String desc;
  const _OwaspItem(this.code, this.name, this.desc);
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _SecKpi extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _SecKpi({required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.35)),
        color: color.withOpacity(0.07),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(value, style: TextStyle(color: color, fontSize: 28, fontWeight: FontWeight.w900, height: 1)),
          const SizedBox(height: 3),
          Text(label, style: TextStyle(color: Colors.white.withOpacity(0.45), fontSize: 12)),
        ],
      ),
    );
  }
}

class _StrideCard extends StatelessWidget {
  final _StrideItem item;
  const _StrideCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC00).withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFFFCC00).withOpacity(0.18), width: 1),
      ),
      child: Row(
        children: [
          Container(
            width: 32, height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFCC00).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: const Color(0xFFFFCC00).withOpacity(0.45)),
            ),
            child: Text(item.letter, style: const TextStyle(
              color: Color(0xFFFFCC00), fontSize: 16, fontWeight: FontWeight.w900,
            )),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: [
                  Text(item.name, style: const TextStyle(
                    color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700,
                  )),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text('— ${item.threat}', style: TextStyle(
                      color: Colors.white.withOpacity(0.55), fontSize: 12,
                    ), overflow: TextOverflow.ellipsis),
                  ),
                ]),
                const SizedBox(height: 2),
                Text('✓ ${item.prevention}', style: TextStyle(
                  color: const Color(0xFF00FF88).withOpacity(0.80),
                  fontSize: 11.5, height: 1.3,
                ), overflow: TextOverflow.fade, maxLines: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OwaspCard extends StatelessWidget {
  final _OwaspItem item;
  const _OwaspCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFF0055).withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFF0055).withOpacity(0.18), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFFF0055).withOpacity(0.15),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFFFF0055).withOpacity(0.4)),
            ),
            child: Text(item.code, style: const TextStyle(
              color: Color(0xFFFF0055), fontSize: 10, fontWeight: FontWeight.w900,
            )),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(
                  color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.w700,
                )),
                const SizedBox(height: 2),
                Text(item.desc, style: TextStyle(
                  color: Colors.white.withOpacity(0.58),
                  fontSize: 11.5, height: 1.35,
                ), overflow: TextOverflow.fade, maxLines: 2),
              ],
            ),
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

class _ParticlePainter13 extends CustomPainter {
  final double t;
  _ParticlePainter13(this.t);

  static const _c1 = Color(0xFFFF0055);
  static const _c2 = Color(0xFF00FF88);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _S15State._particles) {
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
  bool shouldRepaint(_ParticlePainter13 old) => old.t != t;
}
class _DotGridPainter15 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter15 _) => false;
}