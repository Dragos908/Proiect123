import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 01 – Ce Este o Aplicație? (Layout Extins & Mai Mare)
// ─────────────────────────────────────────────────────────────────────────────

class Slide01WhatIsApp extends StatefulWidget {
  const Slide01WhatIsApp({super.key});
  @override
  State<Slide01WhatIsApp> createState() => _S01State();
}

class _S01State extends State<Slide01WhatIsApp>
    with TickerProviderStateMixin { // Schimbat la TickerProviderStateMixin pentru două animații
  late AnimationController _backgroundCtrl; // Controler pentru animația de fundal

  @override
  void initState() {
    super.initState();
    // Animație pentru fluxul de date de fundal
    _backgroundCtrl = AnimationController(vsync: this, duration: const Duration(seconds: 15))
      ..repeat();
  }

  @override
  void dispose() {
    _backgroundCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const ValueKey('slide_01'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [

        // NOUL FUNDAL ANIMAT: Flux de date Hi-Tech
        AnimatedBuilder(
          animation: _backgroundCtrl,
          builder: (context, child) {
            return CustomPaint(painter: _TechFlowPainter(animation: _backgroundCtrl), size: Size.infinite);
          },
        ),

        // Fundal luminos dreapta-sus
        Positioned(
          top: -120, right: -80,
          child: Container(
            width: 600, height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00F0FF).withOpacity(0.12),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        // Fundal luminos stânga-jos
        Positioned(
          bottom: -100, left: 50,
          child: Container(
            width: 450, height: 450,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00FF88).withOpacity(0.10),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        // Am redus puțin padding-ul exterior pentru a lăsa conținutul să respire mai mult spre margini
        Padding(
          padding: const EdgeInsets.fromLTRB(60, 40, 60, 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ── STÂNGA: Număr + Titlu + LOC PENTRU POZĂ ──────────────────────
              SizedBox(
                width: 500, // Lățime mult mai mare
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Indicator număr slide
                    Row(children: [
                      Container(width: 60, height: 4, color: const Color(0xFF00F0FF)),
                      const SizedBox(width: 16),
                      const Text('01', style: TextStyle(
                        color: Color(0xFF00F0FF), fontSize: 18,
                        fontWeight: FontWeight.w800, letterSpacing: 4,
                      )),
                    ]).animate().fadeIn(duration: 500.ms),

                    const SizedBox(height: 24),

                    // Titlul mărit
                    ShaderMask(
                      shaderCallback: (b) => const LinearGradient(
                        colors: [Colors.white, Color(0xFF90D8FF)],
                      ).createShader(b),
                      child: const Text(
                        'Ce Este o\nAplicație?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 72, // FONT MULT MAI MARE
                          fontWeight: FontWeight.w900,
                          height: 1.05,
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 900.ms, delay: 200.ms)
                        .slideY(begin: 0.08, end: 0, duration: 700.ms, delay: 200.ms),

                    const SizedBox(height: 48),

                    // ── IMAGINEA TA ─────────────────────────────────────
                    Container(
                      height: 380,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF00F0FF).withOpacity(0.4),
                          width: 2.0,
                        ),
                      ),
                      // Folosim ClipRRect pentru ca imaginea să nu iasă din marginile rotunjite
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/images/01.webp',
                          fit: BoxFit.cover, // Acoperă tot spațiul
                        ),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 400.ms).scale(begin: const Offset(0.95, 0.95)),
                  ],
                ),
              ),

              const SizedBox(width: 70), // Spațiu mai mare între cele două coloane

              // ── DREAPTA: Informația text (Extinsă) ───────────────────────
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Definiția principală
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF00F0FF).withOpacity(0.4), width: 1.5),
                          color: const Color(0xFF00F0FF).withOpacity(0.08),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF00F0FF).withOpacity(0.05),
                              blurRadius: 24,
                              spreadRadius: 4,
                            )
                          ]
                      ),
                      child: const Text(
                        'Aplicația este un program sau un grup de programe creat pentru a îndeplini o funcție specifică pentru utilizator sau pentru un sistem.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // FONT MĂRIT
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                      ),
                    ).animate().fadeIn(duration: 700.ms, delay: 300.ms).slideX(begin: 0.05),

                    const SizedBox(height: 48), // Spațiu crescut între blocuri

                    // Paragraful 1: Dispozitive
                    const _FeatureRow(
                      icon: Icons.devices_other_rounded,
                      color: Color(0xFF00F0FF),
                      text: 'În prezent, aplicațiile sunt pe toate tipurile de dispozitive: telefoane mobile, tablete, laptopuri, calculatoare, televizoare, ceasuri inteligente, automobile și chiar aparate electrocasnice.',
                      delay: 500,
                    ),

                    const SizedBox(height: 36),

                    // Paragraful 2: Utilizare zilnică
                    const _FeatureRow(
                      icon: Icons.touch_app_rounded,
                      color: Color(0xFF00FF88),
                      text: 'Un om obișnuit interacționează cu zeci de aplicații în fiecare zi, de la alarma de dimineață, la aplicația de email sau rețele sociale.',
                      delay: 700,
                    ),

                    const SizedBox(height: 36),

                    // Paragraful 3: Eficiență
                    const _FeatureRow(
                      icon: Icons.trending_up_rounded,
                      color: Color(0xFFFFCC00),
                      text: 'Ele contribuie semnificativ la creșterea eficienței și productivității, automatizând sarcini și devenind instrumente esențiale în educație și în mediul profesional.',
                      delay: 900,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Linia subțire animată (Neon) din stânga - ȘTEARSĂ
      ]),
    );
  }
}

// ── WIDGET PENTRU PARAGRAFELE TALE (Mărit) ──────────────────────────────

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final int delay;

  const _FeatureRow({
    required this.icon,
    required this.color,
    required this.text,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 28), // Iconițe mai vizibile
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 20, // FONT MĂRIT PENTRU TEXT
              height: 1.45,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 600.ms, delay: Duration(milliseconds: delay)).slideX(begin: 0.05);
  }
}

// ── NOU: CustomPainter pentru Fluxul de Date Hi-Tech ──

class _TechFlowPainter extends CustomPainter {
  final Animation<double> animation;

  _TechFlowPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final cyanPaint = Paint()
      ..color = const Color(0xFF00F0FF).withOpacity(0.12)
      ..style = PaintingStyle.fill;
    final greenPaint = Paint()
      ..color = const Color(0xFF00FF88).withOpacity(0.08)
      ..style = PaintingStyle.fill;
    final textPaint = TextStyle(
      color: Colors.white.withOpacity(0.1),
      fontSize: 10,
      fontFamily: 'Monospace',
    );

    final step = 48.0;
    final animationValue = animation.value;

    // Desenează grupuri de date care curg
    for (double x = 0; x < size.width; x += step) {
      for (double y = 0; y < size.height; y += step * 0.8) {

        // Efect de animație: mișcare orizontală
        double offsetX = (x + animationValue * 300) % size.width;
        double offsetY = y;

        // Variație randomizată (pentru a nu fi o grilă perfectă)
        offsetY += 12 * math.sin((x / step) + animationValue * 4 * math.pi);
        offsetX += 8 * math.cos((y / step) + animationValue * 2 * math.pi);

        // Alege aleatoriu ce să desenezi
        if ((x / step).toInt() % 4 == 0) {
          // Desenează o scurtă linie neon
          canvas.drawRRect(
            RRect.fromRectAndRadius(Rect.fromLTWH(offsetX, offsetY, step * 0.7, 3), const Radius.circular(1.5)),
            (x + y).toInt() % 2 == 0 ? cyanPaint : greenPaint,
          );
        } else if ((x / step).toInt() % 4 == 1) {
          // Desenează un caracter numeric abstract
          final textSpan = TextSpan(text: ((x + y + (animationValue * 100).toInt()).toInt() % 10).toString(), style: textPaint);
          final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
          textPainter.layout();
          textPainter.paint(canvas, Offset(offsetX, offsetY));
        } else if ((x / step).toInt() % 4 == 2) {
          // Desenează un punct neon
          canvas.drawCircle(
            Offset(offsetX, offsetY),
            2.0,
            Paint()..color = greenPaint.color.withOpacity(cyanPaint.color.opacity)..style = PaintingStyle.fill,
          );
        } else {
          // Lasă spațiu gol
        }
      }
    }
  }

  @override
  bool shouldRepaint(_TechFlowPainter _) => true; // Re-pictează la fiecare frame de animație
}