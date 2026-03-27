import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 10 – Design System, Accesibilitate, Mobile-First & Motion
// ─────────────────────────────────────────────────────────────────────────────

class Slide10DesignSystem extends StatefulWidget {
  const Slide10DesignSystem({super.key});
  @override
  State<Slide10DesignSystem> createState() => _S10State();
}

class _S10State extends State<Slide10DesignSystem>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  static const _systemLevels = [
    _SystemLevel(
      label: 'Fundații vizuale',
      content: 'Paletă de culori cu roluri semantice · Tipografie: font families și scale · Spațiere și grid pe 8px · Iconografie unificată.',
      color: Color(0xFF00F0FF),
    ),
    _SystemLevel(
      label: 'Componente atomice',
      content: 'Butoane cu toate stările (default, hover, focus, disabled, loading) · Inputuri, checkboxuri, radio · Badges, tags, avatare.',
      color: Color(0xFF00FF88),
    ),
    _SystemLevel(
      label: 'Componente moleculare',
      content: 'Carduri, tabele, formulare, modals, drawers, tooltips · Feedback: toast notifications, progress bars.',
      color: Color(0xFF90D8FF),
    ),
    _SystemLevel(
      label: 'Componente organism',
      content: 'Headers, sidebars, footers, data tables complexe, wizard flows, dashboard templates.',
      color: Color(0xFFFFCC00),
    ),
  ];

  static const _wcagItems = [
    _WcagItem('Contrast text', 'Minim 4.5:1 pentru text normal · 3:1 pentru text mare (>18px bold sau >24px)'),
    _WcagItem('Navigare cu tastatură', 'Toate elementele interactive accesibile cu Tab · Focus indicator vizibil și clar'),
    _WcagItem('Texte alternative', 'Alt text descriptiv pentru imagini informative · Imagini decorative cu alt=""'),
    _WcagItem('Structură semantică', 'Heading-uri în ordine ierarhică · Landmark regions (main, nav, aside)'),
    _WcagItem('Dimensiuni touch targets', 'Minim 44×44px pentru elemente interactive pe mobile (standard Apple și Google)'),
  ];

  static const _mobileFirstItems = [
    'Începe cu constrângerile cele mai stricte, extinde progresiv.',
    'Breakpoints: 320px · 375px · 768px · 1024px · 1440px',
    'Tipografie fluidă: clamp() CSS pentru scalare automată.',
    'FCP < 1.8s pe 4G · TBT < 200ms',
  ];

  static const _motionItems = [
    'Ease In/Out: mișcările naturale încep lent, accelerează, se încetinesc.',
    'Micro-animații: 50–150ms · Tranziții UI: 200–400ms',
    'prefers-reduced-motion: respectați preferința utilizatorilor.',
    'Skeleton screens: mai bune decât spinners pentru conținut predictibil.',
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
      key: const ValueKey('slide_10'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [
        CustomPaint(painter: _DotGridPainter10(), size: Size.infinite),

        Positioned(
          top: -100, right: -60,
          child: Container(
            width: 500, height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                const Color(0xFF90D8FF).withOpacity(0.09),
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
                const Color(0xFF00FF88).withOpacity(0.07),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(72, 28, 72, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── HEADER ──────────────────────────────────────────────────
              Row(children: [
                Container(width: 56, height: 4, color: const Color(0xFF00F0FF)),
                const SizedBox(width: 16),
                const Text('10', style: TextStyle(
                  color: Color(0xFF00F0FF), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFF00F0FF).withOpacity(0.4)),
                const SizedBox(width: 10),
                Text('DESIGN SYSTEM · WCAG · MOTION',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 8),

              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Colors.white, Color(0xFF90D8FF)],
                ).createShader(b),
                child: const Text(
                  'Design System &\nAccesibilitate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 62,
                    fontWeight: FontWeight.w900,
                    height: 1.0,
                    letterSpacing: -1.5,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 900.ms, delay: 200.ms)
                  .slideY(begin: 0.07, end: 0, duration: 700.ms, delay: 200.ms),

              const SizedBox(height: 14),

              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ── COLOANA STÂNGA: Design System ────────────────────
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
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
                              const Icon(Icons.layers_outlined,
                                  color: Color(0xFF00F0FF), size: 20),
                              const SizedBox(width: 8),
                              const Text('DESIGN SYSTEM UI',
                                  style: TextStyle(
                                    color: Color(0xFF00F0FF),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                  )),
                            ]),
                            const SizedBox(height: 12),
                            Expanded(
                              child: Column(
                                children: List.generate(_systemLevels.length, (i) {
                                  final s = _systemLevels[i];
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: i < _systemLevels.length - 1 ? 8 : 0),
                                      child: _SystemLevelCard(level: s)
                                          .animate()
                                          .fadeIn(duration: 500.ms, delay: Duration(milliseconds: 300 + i * 100))
                                          .slideX(begin: -0.05, end: 0, duration: 450.ms, delay: Duration(milliseconds: 300 + i * 100)),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // ── COLOANA MIJLOC: Accesibilitate WCAG ──────────────
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00FF88).withOpacity(0.03),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF00FF88).withOpacity(0.22),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Icon(Icons.accessibility_new_outlined,
                                  color: Color(0xFF00FF88), size: 20),
                              const SizedBox(width: 8),
                              const Flexible(
                                child: Text('ACCESIBILITATE WCAG 2.1 — AA',
                                    style: TextStyle(
                                      color: Color(0xFF00FF88),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1.5,
                                    )),
                              ),
                            ]),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00FF88).withOpacity(0.08),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.2)),
                              ),
                              child: Text(
                                'Accesibilitatea este un drept și, prin EU Accessibility Act 2025, o obligație legală.',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 11.5,
                                  fontStyle: FontStyle.italic,
                                  height: 1.35,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Column(
                                children: List.generate(_wcagItems.length, (i) {
                                  final w = _wcagItems[i];
                                  return Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: i < _wcagItems.length - 1 ? 6 : 0),
                                      child: _WcagCard(item: w)
                                          .animate()
                                          .fadeIn(duration: 500.ms, delay: Duration(milliseconds: 350 + i * 90))
                                          .slideX(begin: 0.05, end: 0, duration: 450.ms, delay: Duration(milliseconds: 350 + i * 90)),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    // ── COLOANA DREAPTA: Mobile-First + Motion ────────────
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF90D8FF).withOpacity(0.03),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color(0xFF90D8FF).withOpacity(0.22), width: 1.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Icon(Icons.phone_iphone,
                                        color: Color(0xFF90D8FF), size: 18),
                                    const SizedBox(width: 8),
                                    const Text('MOBILE-FIRST',
                                        style: TextStyle(
                                          color: Color(0xFF90D8FF),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2,
                                        )),
                                  ]),
                                  const SizedBox(height: 10),
                                  ..._mobileFirstItems.map((t) => Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('→ ',
                                            style: TextStyle(color: Color(0xFF90D8FF), fontSize: 11)),
                                        Expanded(
                                          child: Text(t, style: TextStyle(
                                            color: Colors.white.withOpacity(0.72),
                                            fontSize: 11.5,
                                            height: 1.35,
                                          )),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 500.ms)
                                .slideY(begin: 0.06, end: 0, duration: 500.ms, delay: 500.ms),
                          ),

                          const SizedBox(height: 14),

                          Expanded(
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFCC00).withOpacity(0.03),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color(0xFFFFCC00).withOpacity(0.22), width: 1.5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    const Icon(Icons.animation,
                                        color: Color(0xFFFFCC00), size: 18),
                                    const SizedBox(width: 8),
                                    const Text('MOTION DESIGN',
                                        style: TextStyle(
                                          color: Color(0xFFFFCC00),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 2,
                                        )),
                                  ]),
                                  const SizedBox(height: 10),
                                  ..._motionItems.map((t) => Padding(
                                    padding: const EdgeInsets.only(bottom: 6),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text('→ ',
                                            style: TextStyle(color: Color(0xFFFFCC00), fontSize: 11)),
                                        Expanded(
                                          child: Text(t, style: TextStyle(
                                            color: Colors.white.withOpacity(0.72),
                                            fontSize: 11.5,
                                            height: 1.35,
                                          )),
                                        ),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                            ).animate().fadeIn(duration: 600.ms, delay: 650.ms)
                                .slideY(begin: 0.06, end: 0, duration: 500.ms, delay: 650.ms),
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

// ── Data classes ──────────────────────────────────────────────────────────────

class _SystemLevel {
  final String label;
  final String content;
  final Color color;
  const _SystemLevel({required this.label, required this.content, required this.color});
}

class _WcagItem {
  final String criterion;
  final String impl;
  const _WcagItem(this.criterion, this.impl);
}

// ── Widgets ───────────────────────────────────────────────────────────────────

class _SystemLevelCard extends StatelessWidget {
  final _SystemLevel level;
  const _SystemLevelCard({required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: level.color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: level.color.withOpacity(0.25), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(level.label, style: TextStyle(
            color: level.color,
            fontSize: 12.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          )),
          const SizedBox(height: 3),
          Flexible(
            child: Text(level.content, style: TextStyle(
              color: Colors.white.withOpacity(0.65),
              fontSize: 11.5,
              height: 1.35,
            ), overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }
}

class _WcagCard extends StatelessWidget {
  final _WcagItem item;
  const _WcagCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF00FF88).withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF00FF88).withOpacity(0.18), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.criterion, style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          )),
          const SizedBox(height: 2),
          Flexible(
            child: Text(item.impl, style: TextStyle(
              color: Colors.white.withOpacity(0.60),
              fontSize: 11,
              height: 1.3,
            ), overflow: TextOverflow.fade),
          ),
        ],
      ),
    );
  }
}

class _DotGridPainter10 extends CustomPainter {
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
  bool shouldRepaint(_DotGridPainter10 _) => false;
}