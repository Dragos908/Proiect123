import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Slide 08 – Backend & Securitate Cibernetică
// ─────────────────────────────────────────────────────────────────────────────

class Slide08BackendSecurity extends StatefulWidget {
  const Slide08BackendSecurity({super.key});
  @override
  State<Slide08BackendSecurity> createState() => _S08State();
}

class _S08State extends State<Slide08BackendSecurity>
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
      key: const ValueKey('slide_08'),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF020609), Color(0xFF060A14), Color(0xFF030D13)],
        ),
      ),
      child: Stack(children: [

        // ── FUNDAL HI-TECH ───────────────────────────────────────────────────

        // Circuit board animat
        AnimatedBuilder(
          animation: _circuitCtrl,
          builder: (_, __) => CustomPaint(
            painter: _CircuitBoardPainter08(
              progress: _circuitCtrl.value,
              primaryColor: const Color(0xFF00FF88),
              secondaryColor: const Color(0xFFFF0055),
            ),
            size: Size.infinite,
          ),
        ),

        // Scan line sweep
        AnimatedBuilder(
          animation: _scanCtrl,
          builder: (_, __) => CustomPaint(
            painter: _ScanLinePainter08(
              progress: _scanCtrl.value,
              color: const Color(0xFF00FF88),
            ),
            size: Size.infinite,
          ),
        ),

        // Particule flotante
        AnimatedBuilder(
          animation: _particleCtrl,
          builder: (_, __) => CustomPaint(
            painter: _ParticlePainter08(_particleCtrl.value),
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
                const Color(0xFF00FF88).withOpacity(0.09),
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
                const Color(0xFFFF0055).withOpacity(0.09),
                Colors.transparent,
              ]),
            ),
          ),
        ),

        // ── CONȚINUT ─────────────────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(72, 36, 72, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ── HEADER ────────────────────────────────────────────────────
              Row(children: [
                Container(width: 56, height: 4, color: const Color(0xFF00FF88)),
                const SizedBox(width: 16),
                const Text('08', style: TextStyle(
                  color: Color(0xFF00FF88), fontSize: 18,
                  fontWeight: FontWeight.w800, letterSpacing: 4,
                )),
                const SizedBox(width: 10),
                Container(width: 1, height: 18,
                    color: const Color(0xFF00FF88).withOpacity(0.4)),
                const SizedBox(width: 10),
                Text('INFRASTRUCTURĂ · DATE · PROTECȚIE',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.42),
                      fontSize: 16, letterSpacing: 3,
                    )),
              ]).animate().fadeIn(duration: 500.ms),

              const SizedBox(height: 14),

              // ── TITLU ─────────────────────────────────────────────────────
              ShaderMask(
                shaderCallback: (b) => const LinearGradient(
                  colors: [Colors.white, Color(0xFF90FFD8)],
                ).createShader(b),
                child: const Text(
                  'Backend & CyberSec',
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

              const SizedBox(height: 24),

              // ── LAYOUT PRINCIPAL: 2 COLOANE ────────────────────────────────
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // ══════════════════════════════════════════
                    // COLOANA STÂNGA – Backend
                    // ══════════════════════════════════════════
                    Expanded(
                      child: _DomainCard(
                        delay: 300,
                        accentColor: const Color(0xFF00FF88),
                        icon: Icons.storage_rounded,
                        title: 'Backend & Baze de Date',
                        description:
                        'Funcționează pe server, fără interfață vizuală directă. Procesează cereri, gestionează autentificarea, stochează date și execută logica de business invizibilă utilizatorului.',
                        trendText:
                        'Arhitectură: API-uri REST/GraphQL, microservicii, cozi de mesaje (Kafka). Scalabilitatea este vitală pentru a servi milioane de cereri. Limbajul Go excelează aici prin viteza sa.',
                        techList: const [
                          _TechItem('SQL', 'Standard universal BD relaționale'),
                          _TechItem('Java/Kotlin', 'Enterprise / Spring Boot'),
                          _TechItem('Go', 'API-uri ultra-rapide, concurență'),
                          _TechItem('Rust', 'Performanță & siguranța memoriei'),
                          _TechItem('Python', 'FastAPI, Django REST'),
                          _TechItem('Node.js', 'JS pe server (Express, NestJS)'),
                          _TechItem('C#', 'Ecosistem Microsoft / ASP.NET'),
                        ],
                        imagePath: 'assets/baza.png',
                        imageLabel: 'baza.png',
                      ),
                    ),

                    const SizedBox(width: 28),

                    // ══════════════════════════════════════════
                    // COLOANA DREAPTA – CyberSec
                    // ══════════════════════════════════════════
                    Expanded(
                      child: _DomainCard(
                        delay: 500,
                        accentColor: const Color(0xFFFF0055),
                        icon: Icons.security_rounded,
                        title: 'Securitate Cibernetică',
                        description:
                        'Protejează sistemele, rețelele și datele de atacuri. Include antivirusuri, firewall-uri, instrumente de penetration testing și sisteme de detectare a intruziunilor (IDS/IPS).',
                        trendText:
                        'Structură: Red Team (simularea atacurilor) și Blue Team (apărare). Lipsa specialiștilor este acută, iar costul global al atacurilor depășește \$9.5 trilioane anual.',
                        techList: const [
                          _TechItem('Python', 'Automatizare, Scapy, Metasploit'),
                          _TechItem('C / C++', 'Exploatare vulnerabilități low-level'),
                          _TechItem('Assembly', 'Inginerie inversă / analiză malware'),
                          _TechItem('Bash/Shell', 'Scripturi pe sisteme Linux'),
                          _TechItem('PowerShell', 'Administrare sisteme Windows'),
                          _TechItem('Rust', 'Tools moderne și sigure'),
                        ],
                        imagePath: 'assets/monitoring.webp',
                        imageLabel: 'monitoring.webp',
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
                    const Color(0xFF00FF88).withOpacity(0),
                    const Color(0xFF00FF88).withOpacity(
                        0.75 + 0.25 * math.sin(_neonCtrl.value * 2 * math.pi)),
                    const Color(0xFFFF0055).withOpacity(0.65),
                    const Color(0xFF00FF88).withOpacity(0),
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
// CARD CU IMAGINE DIN ASSETS
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

  /// Calea către asset, ex: 'assets/images/backend.png'
  /// Dacă este null se afișează placeholder-ul
  final String? imagePath;
  final String imageLabel;

  const _DomainCard({
    required this.delay,
    required this.accentColor,
    required this.icon,
    required this.title,
    required this.description,
    required this.trendText,
    required this.techList,
    required this.imageLabel,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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

          // ── Titlu card ───────────────────────────────────────────────────
          Row(children: [
            Icon(icon, color: accentColor, size: 34),
            const SizedBox(width: 14),
            Expanded(
              child: Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  )),
            ),
          ]),

          const SizedBox(height: 14),

          // ── Descriere ────────────────────────────────────────────────────
          Text(description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.82),
                fontSize: 14.5,
                height: 1.45,
              )),

          const SizedBox(height: 10),

          // ── Trend box ────────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: accentColor.withOpacity(0.2)),
            ),
            child: Text(trendText,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.72),
                  fontSize: 13,
                  height: 1.4,
                  fontStyle: FontStyle.italic,
                )),
          ),

          const SizedBox(height: 14),

          // ── IMAGINE DIN ASSETS ───────────────────────────────────────────
          _AssetImage(
            imagePath: imagePath,
            accentColor: accentColor,
            label: imageLabel,
          ),

          const SizedBox(height: 14),

          // ── Tehnologii ───────────────────────────────────────────────────
          Text('TEHNOLOGII ȘI LIMBAJE',
              style: TextStyle(
                color: accentColor,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              )),
          const SizedBox(height: 10),

          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: techList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 7),
              itemBuilder: (_, i) {
                final item = techList[i];
                return Row(children: [
                  Container(
                    width: 95,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                      border:
                      Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    alignment: Alignment.center,
                    child: Text(item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(item.desc,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.58),
                          fontSize: 13,
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
// WIDGET IMAGINE – asset sau placeholder
// ─────────────────────────────────────────────────────────────────────────────

class _AssetImage extends StatelessWidget {
  final String? imagePath;
  final Color accentColor;
  final String label;

  const _AssetImage({
    required this.imagePath,
    required this.accentColor,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.35), width: 1.5),
        color: accentColor.withOpacity(0.04),
      ),
      clipBehavior: Clip.antiAlias,
      child: imagePath != null
      // ════════════════════════════════════════
      // IMAGINE REALĂ DIN ASSETS
      // ════════════════════════════════════════
          ? Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath!,
            fit: BoxFit.cover,
            // Dacă imaginea nu există, Image.asset va arunca eroare —
            // în acel caz înlocuiește cu Image.asset + errorBuilder:
            errorBuilder: (_, __, ___) =>
                _PlaceholderContent(accentColor: accentColor, label: label),
          ),
          // Overlay subtil peste imagine
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.35),
                ],
              ),
            ),
          ),
          // Etichetă jos-stânga
          Positioned(
            bottom: 8, left: 10,
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.85),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  )),
            ),
          ),
          // Colțuri decorative
          Positioned(top: 8, left: 8,
              child: _CornerBracket08(color: accentColor)),
          Positioned(top: 8, right: 8,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: _CornerBracket08(color: accentColor),
              )),
        ],
      )
      // ════════════════════════════════════════
      // PLACEHOLDER (imagePath == null)
      // ════════════════════════════════════════
          : _PlaceholderContent(accentColor: accentColor, label: label),
    );
  }
}

/// Afișat când nu există niciun asset setat
class _PlaceholderContent extends StatelessWidget {
  final Color accentColor;
  final String label;
  const _PlaceholderContent(
      {required this.accentColor, required this.label});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.image_outlined,
                  color: accentColor.withOpacity(0.35), size: 38),
              const SizedBox(height: 8),
              Text(label,
                  style: TextStyle(
                    color: accentColor.withOpacity(0.5),
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  )),
              const SizedBox(height: 4),
              Text("imagePath: 'assets/images/...'",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.2),
                    fontSize: 11,
                  )),
            ],
          ),
        ),
        Positioned(top: 8, left: 8,
            child: _CornerBracket08(color: accentColor)),
        Positioned(top: 8, right: 8,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(math.pi),
              child: _CornerBracket08(color: accentColor),
            )),
        Positioned(bottom: 8, left: 8,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationX(math.pi),
              child: _CornerBracket08(color: accentColor),
            )),
        Positioned(bottom: 8, right: 8,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(math.pi),
              child: _CornerBracket08(color: accentColor),
            )),
      ],
    );
  }
}

class _CornerBracket08 extends StatelessWidget {
  final Color color;
  const _CornerBracket08({required this.color});
  @override
  Widget build(BuildContext context) =>
      SizedBox(width: 18, height: 18,
          child: CustomPaint(painter: _CornerPainter08(color)));
}

class _CornerPainter08 extends CustomPainter {
  final Color color;
  _CornerPainter08(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color.withOpacity(0.6)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), p);
    canvas.drawLine(Offset.zero, Offset(0, size.height), p);
  }
  @override bool shouldRepaint(_) => false;
}

// ─────────────────────────────────────────────────────────────────────────────
// PAINTERS FUNDAL HI-TECH
// ─────────────────────────────────────────────────────────────────────────────

class _CircuitBoardPainter08 extends CustomPainter {
  final double progress;
  final Color primaryColor;
  final Color secondaryColor;

  _CircuitBoardPainter08({
    required this.progress,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rng = math.Random(55);
    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;
    final nodePaint = Paint()..style = PaintingStyle.fill;

    const gridX = 14;
    const gridY = 10;
    final cellW = size.width / gridX;
    final cellH = size.height / gridY;

    for (int i = 0; i < 24; i++) {
      final seed = i * 19;
      final startX = (seed % gridX) * cellW + cellW / 2;
      final startY = ((seed ~/ gridX) % gridY) * cellH + cellH / 2;

      final isRed = rng.nextDouble() > 0.65;
      final baseColor = isRed ? secondaryColor : primaryColor;

      final pulseOffset = i / 24.0;
      final pulse = math.sin((progress + pulseOffset) * 2 * math.pi);
      final opacity = 0.04 + 0.07 * ((pulse + 1) / 2);

      linePaint.color = baseColor.withOpacity(opacity);
      nodePaint.color = baseColor.withOpacity(opacity * 2.8);

      final path = Path()..moveTo(startX, startY);
      var cx = startX, cy = startY;

      for (int step = 0; step < 4 + rng.nextInt(3); step++) {
        final dir = rng.nextInt(4);
        final length = (1 + rng.nextInt(2)) * cellW;
        double nx = cx, ny = cy;
        switch (dir) {
          case 0: nx = (cx + length).clamp(0, size.width); break;
          case 1: nx = (cx - length).clamp(0, size.width); break;
          case 2: ny = (cy + length).clamp(0, size.height); break;
          case 3: ny = (cy - length).clamp(0, size.height); break;
        }
        path.lineTo(nx, cy);
        path.lineTo(nx, ny);
        canvas.drawCircle(Offset(nx, ny), 2.8, nodePaint);
        cx = nx; cy = ny;
      }
      canvas.drawPath(path, linePaint);
    }

    // Dot grid de bază
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
  bool shouldRepaint(_CircuitBoardPainter08 old) => old.progress != progress;
}

class _ScanLinePainter08 extends CustomPainter {
  final double progress;
  final Color color;
  _ScanLinePainter08({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final y = progress * size.height;
    final rect = Rect.fromLTWH(0, y - 60, size.width, 120);
    final paint = Paint()
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
      ).createShader(rect);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    canvas.drawLine(Offset(0, y), Offset(size.width, y),
        Paint()..color = color.withOpacity(0.10)..strokeWidth = 1.0);
  }

  @override
  bool shouldRepaint(_ScanLinePainter08 old) => old.progress != progress;
}

class _ParticlePainter08 extends CustomPainter {
  final double progress;
  static final _rng = math.Random(77);
  static final List<_P08> _pts = List.generate(
    40,
        (i) => _P08(
      x: _rng.nextDouble(),
      speed: 0.04 + _rng.nextDouble() * 0.14,
      size: 1.0 + _rng.nextDouble() * 2.2,
      isRed: _rng.nextDouble() > 0.72,
      phase: _rng.nextDouble(),
    ),
  );

  _ParticlePainter08(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in _pts) {
      final t = (progress * p.speed + p.phase) % 1.0;
      final x = p.x * size.width;
      final y = (1.0 - t) * size.height;
      final opacity = 0.15 * math.sin(t * math.pi);
      canvas.drawCircle(
        Offset(x, y),
        p.size,
        Paint()
          ..color = (p.isRed
              ? const Color(0xFFFF0055)
              : const Color(0xFF00FF88))
              .withOpacity(opacity),
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter08 old) => old.progress != progress;
}

class _P08 {
  final double x, speed, size, phase;
  final bool isRed;
  const _P08(
      {required this.x,
        required this.speed,
        required this.size,
        required this.isRed,
        required this.phase});
}