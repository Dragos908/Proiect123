import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 13 – Design UI/UX — Principii & Navigație (Full Redesign)
// Layout: Header+Title (top) | 3 coloane: UX Principii | Fotografie | Navigație
// ─────────────────────────────────────────────────────────────────────────────

class Slide11DesignUX extends StatefulWidget {
  const Slide11DesignUX({super.key});
  @override
  State<Slide11DesignUX> createState() => _S11State();
}

class _S11State extends State<Slide11DesignUX>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  static const _uxPrinciples = [
    _UXPrinciple(
      icon: Icons.check_circle_outline,
      label: 'Utilitate',
      color: Color(0xFF00F0FF),
      desc: 'Ajută utilizatorul să-și atingă obiectivul.',
    ),
    _UXPrinciple(
      icon: Icons.school_outlined,
      label: 'Ușurință de învățare',
      color: Color(0xFF00FF88),
      desc: 'Cât de repede poate un utilizator nou să efectueze o sarcină?',
    ),
    _UXPrinciple(
      icon: Icons.speed_outlined,
      label: 'Eficiență',
      color: Color(0xFF90D8FF),
      desc: 'Cât de rapid efectuează utilizatorul expert sarcinile?',
    ),
    _UXPrinciple(
      icon: Icons.refresh_outlined,
      label: 'Memorabilitate',
      color: Color(0xFFFFCC00),
      desc: 'După o pauză, utilizatorul poate relua activitatea ușor?',
    ),
    _UXPrinciple(
      icon: Icons.error_outline,
      label: 'Gestionarea erorilor',
      color: Color(0xFFFF6BFF),
      desc: 'Erorile sunt prevenite? Mesajele sunt clare și acționabile?',
    ),
    _UXPrinciple(
      icon: Icons.sentiment_satisfied_alt_outlined,
      label: 'Satisfacție',
      color: Color(0xFF00F0FF),
      desc: 'Interacțiunea este plăcută? Utilizatorul recomandă produsul?',
    ),
  ];

  static const _navPatterns = [
    _NavPattern(
      label: 'Top Navigation Bar',
      desc: 'Ideal pentru aplicații cu puține secțiuni principale.',
      icon: Icons.horizontal_distribute,
      color: Color(0xFF00F0FF),
    ),
    _NavPattern(
      label: 'Sidebar Navigation',
      desc: 'Potrivită pentru aplicații complexe cu ierarhii profunde.',
      icon: Icons.view_sidebar_outlined,
      color: Color(0xFF00FF88),
    ),
    _NavPattern(
      label: 'Bottom Navigation',
      desc: 'Thumb-friendly. Max 5 items. Necesită icon + text.',
      icon: Icons.tab_outlined,
      color: Color(0xFF90D8FF),
    ),
    _NavPattern(
      label: 'Breadcrumbs',
      desc: 'Esențial pentru aplicații cu ierarhii de 3+ nivele.',
      icon: Icons.more_horiz,
      color: Color(0xFFFFCC00),
    ),
    _NavPattern(
      label: 'Progressive Disclosure',
      desc: 'Arătați doar esențialul; detaliile se revelează la cerere.',
      icon: Icons.unfold_more_outlined,
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
      key: const ValueKey('slide_13'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [

        // ── DOT GRID BACKGROUND ──────────────────────────────────────────────
        CustomPaint(painter: _DotGridPainter11(), size: Size.infinite),

        // ── GLOW ORBS ────────────────────────────────────────────────────────
        Positioned(
          top: -100, right: -60,
          child: Container(
            width: 500, height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00F0FF).withOpacity(0.09),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        Positioned(
          bottom: -80, left: 40,
          child: Container(
            width: 380, height: 380,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF00FF88).withOpacity(0.07),
                Colors.transparent,
              ]),
            ),
          ),
        ),
        // Glow centru (sub fotografie)
        Positioned(
          top: 0, bottom: 0,
          left: 0, right: 0,
          child: Center(
            child: Container(
              width: 340, height: 340,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  const Color(0xFF90D8FF).withOpacity(0.06),
                  Colors.transparent,
                ]),
              ),
            ),
          ),
        ),

        // ── CONȚINUT PRINCIPAL ───────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(44, 22, 44, 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER ────────────────────────────────────────────────────
              Row(children: [
                Container(width: 40, height: 3, color: const Color(0xFF00F0FF)),
                const SizedBox(width: 12),
                const Text('13', style: TextStyle(
                  color: Color(0xFF00F0FF), fontSize: 15,
                  fontWeight: FontWeight.w800, letterSpacing: 2,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 14,
                    color: const Color(0xFF00F0FF).withOpacity(0.4)),
                const SizedBox(width: 10),
                Text('DESIGN UI/UX · PRINCIPII & NAVIGAȚIE',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.38),
                      fontSize: 13, letterSpacing: 2.5,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 6),

              // ── TITLU + SUBTITLU ──────────────────────────────────────────
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ShaderMask(
                    shaderCallback: (b) => const LinearGradient(
                      colors: [Colors.white, Color(0xFF90D8FF)],
                    ).createShader(b),
                    child: const Text(
                      'Principii UX & Navigație',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 46,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                        letterSpacing: -1.2,
                      ),
                    ),
                  ).animate()
                      .fadeIn(duration: 900.ms, delay: 200.ms)
                      .slideY(begin: 0.06, end: 0, duration: 700.ms, delay: 200.ms),
                  const SizedBox(width: 20),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      'UX este știință — fluxuri, reducerea fricțiunii.\nUI este artă — vizual, culori, emoție.',
                      style: TextStyle(
                        color: const Color(0xFF00F0FF).withOpacity(0.60),
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        height: 1.5,
                      ),
                    ).animate().fadeIn(duration: 700.ms, delay: 400.ms),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // ── 3 COLOANE: UX Principii | Fotografie | Navigație ─────────
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── COLOANA STÂNGA: Principii UX ──────────────────────
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionLabel(
                            label: 'PRINCIPII FUNDAMENTALE UX',
                            color: const Color(0xFF00F0FF),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Column(
                              children: List.generate(_uxPrinciples.length, (i) {
                                final p = _uxPrinciples[i];
                                return Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: i < _uxPrinciples.length - 1 ? 7 : 0),
                                    child: _UXCard(principle: p)
                                        .animate()
                                        .fadeIn(duration: 500.ms, delay: Duration(milliseconds: 250 + i * 70))
                                        .slideX(begin: -0.05, end: 0, duration: 450.ms, delay: Duration(milliseconds: 250 + i * 70)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 18),

                    // ── COLOANA CENTRU: Fotografie ─────────────────────────
                    Expanded(
                      flex: 4,
                      child: _PhotoColumn()
                          .animate()
                          .fadeIn(duration: 800.ms, delay: 300.ms)
                          .scale(
                        begin: const Offset(0.97, 0.97),
                        end: const Offset(1, 1),
                        duration: 700.ms,
                        delay: 300.ms,
                      ),
                    ),

                    const SizedBox(width: 18),

                    // ── COLOANA DREAPTA: Patternuri Navigație ──────────────
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _SectionLabel(
                            label: 'PATTERNURI DE NAVIGAȚIE',
                            color: const Color(0xFF00FF88),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: Column(
                              children: List.generate(_navPatterns.length, (i) {
                                final n = _navPatterns[i];
                                return Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        bottom: i < _navPatterns.length - 1 ? 7 : 0),
                                    child: _NavCard(pattern: n)
                                        .animate()
                                        .fadeIn(duration: 500.ms, delay: Duration(milliseconds: 350 + i * 80))
                                        .slideX(begin: 0.05, end: 0, duration: 450.ms, delay: Duration(milliseconds: 350 + i * 80)),
                                  ),
                                );
                              }),
                            ),
                          ),
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
            animation: _ctrl,
            builder: (_, __) => Container(
              width: 4,
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

// ─────────────────────────────────────────────────────────────────────────────
// PHOTO COLUMN — imaginea ocupă întreaga înălțime a coloanei, natural
// ─────────────────────────────────────────────────────────────────────────────
class _PhotoColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Label deasupra
        _SectionLabel(
          label: 'UI/UX ÎN PRACTICĂ',
          color: const Color(0xFF90D8FF),
        ),
        const SizedBox(height: 10),
        // Fotografie — Expanded ca să ocupe tot spațiul rămas
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── ETICHETĂ STÂNGA ──────────────────────────────────────
              Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    'EXPERIENȚĂ · FLUX · ARHITECTURĂ',
                    style: TextStyle(
                      color: const Color(0xFF00F0FF).withOpacity(0.55),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.2,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),

              // ── IMAGINEA ──────────────────────────────────────────────
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF90D8FF).withOpacity(0.30),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00F0FF).withOpacity(0.08),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.5),
                    child: Image.asset('assets/images/44.png')
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Placeholder vizual dacă imaginea nu e găsită
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF90D8FF).withOpacity(0.05),
                            borderRadius: BorderRadius.circular(14.5),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.image_outlined,
                                    color: const Color(0xFF90D8FF).withOpacity(0.4),
                                    size: 48),
                                const SizedBox(height: 10),
                                Text('images/44.png',
                                    style: TextStyle(
                                      color: const Color(0xFF90D8FF).withOpacity(0.4),
                                      fontSize: 12,
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ), // Expanded (imagine)

              const SizedBox(width: 4),
              // ── ETICHETĂ DREAPTA ─────────────────────────────────────
              Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    'VIZUAL · CULOARE · EMOȚIE',
                    style: TextStyle(
                      color: const Color(0xFF00FF88).withOpacity(0.55),
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DATA CLASSES
// ─────────────────────────────────────────────────────────────────────────────

class _UXPrinciple {
  final IconData icon;
  final String label;
  final Color color;
  final String desc;
  const _UXPrinciple(
      {required this.icon,
        required this.label,
        required this.color,
        required this.desc});
}

class _NavPattern {
  final String label;
  final String desc;
  final IconData icon;
  final Color color;
  const _NavPattern(
      {required this.label,
        required this.desc,
        required this.icon,
        required this.color});
}

// ─────────────────────────────────────────────────────────────────────────────
// WIDGETS
// ─────────────────────────────────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  final Color color;
  const _SectionLabel({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(width: 3, height: 12, color: color),
      const SizedBox(width: 8),
      Text(label,
          style: TextStyle(
            color: color,
            fontSize: 10.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
          )),
    ]);
  }
}

class _UXCard extends StatelessWidget {
  final _UXPrinciple principle;
  const _UXCard({required this.principle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: principle.color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border:
        Border.all(color: principle.color.withOpacity(0.22), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: principle.color.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(principle.icon, color: principle.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(principle.label,
                    style: TextStyle(
                      color: principle.color,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )),
                const SizedBox(height: 3),
                Text(principle.desc,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.58),
                      fontSize: 11,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final _NavPattern pattern;
  const _NavCard({required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: pattern.color.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: pattern.color.withOpacity(0.22), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: pattern.color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(pattern.icon, color: pattern.color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(pattern.label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    )),
                const SizedBox(height: 3),
                Text(pattern.desc,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.55),
                      fontSize: 11,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS
// ─────────────────────────────────────────────────────────────────────────────

class _DotGridPainter11 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter11 _) => false;
}