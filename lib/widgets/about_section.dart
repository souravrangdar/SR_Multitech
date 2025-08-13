// lib/widgets/about_section.dart
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: _AboutContent(),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  const _AboutContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 700;
        final isTablet = constraints.maxWidth < 1000 && constraints.maxWidth >= 700;

        final titleStyle = theme.textTheme.headlineSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        );

        final bodyStyle = theme.textTheme.bodyMedium?.copyWith(
          color: Colors.white70,
          height: 1.5,
        );

        final cardPadding = EdgeInsets.all(isMobile ? 16 : 20);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tagline Banner
            _TaglineBanner(isMobile: isMobile),

            const SizedBox(height: 32),

            // About Us paragraph
            Text('About @SR_Multitech', style: titleStyle),
            const SizedBox(height: 12),
            Text(
              'At @SR_Multitech, we are driven by a passion for innovation and a commitment to '
                  'delivering cutting-edge solutions in technology, engineering, and digital transformation. '
                  'We combine creativity with deep technical expertise to turn ambitious ideas into reliable, '
                  'scalable products that empower people and accelerate growth.',
              style: bodyStyle,
            ),

            const SizedBox(height: 28),

            // Highlights / Value props (responsive grid via Wrap)
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _InfoCard(
                  padding: cardPadding,
                  icon: Icons.auto_awesome,
                  title: 'Innovating Beyond Boundaries',
                  text:
                  'We push ideas from concept to reality with pragmatic engineering and delightful design.',
                ),
                _InfoCard(
                  padding: cardPadding,
                  icon: Icons.lock_outline,
                  title: 'Secure & Scalable',
                  text:
                  'Solutions architected for performance, security, and future growth.',
                ),
                _InfoCard(
                  padding: cardPadding,
                  icon: Icons.handshake_outlined,
                  title: 'Partner, Not Vendor',
                  text:
                  'We collaborate end-to-end—strategy, build, launch, and iteration.',
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Mission & Vision (side-by-side on wide screens)
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _GlassCard(
                    padding: cardPadding,
                    child: _MVBlock(
                      icon: Icons.flag_outlined,
                      title: 'Our Mission',
                      text:
                      'Empower individuals, businesses, and communities through innovative, '
                          'reliable, and sustainable technology that simplifies lives and accelerates growth.',
                    ),
                  ),
                ),
                if (!isMobile) const SizedBox(width: 16) else const SizedBox(height: 16),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: _GlassCard(
                    padding: cardPadding,
                    child: _MVBlock(
                      icon: Icons.visibility_outlined,
                      title: 'Our Vision',
                      text:
                      'A world where technology is a seamless extension of human potential—'
                          'enabling limitless possibilities and inspiring the next wave of global innovation.',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Simple CTA band
            _CTABand(isTablet: isTablet, isMobile: isMobile),
          ],
        );
      },
    );
  }
}

class _TaglineBanner extends StatelessWidget {
  final bool isMobile;
  const _TaglineBanner({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 18 : 22,
      ),
      child: Row(
        children: [
          const Icon(Icons.bolt, color: Colors.cyanAccent, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Engineering the Future, Today.',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 18 : 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (!isMobile)
            Text(
              '@SR_Multitech',
              style: TextStyle(
                color: Colors.cyanAccent.withOpacity(0.9),
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final EdgeInsets padding;
  final IconData icon;
  final String title;
  final String text;

  const _InfoCard({
    required this.padding,
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 260, maxWidth: 380),
      child: _GlassCard(
        padding: padding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.cyanAccent, size: 26),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      )),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white70, height: 1.45),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MVBlock extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;

  const _MVBlock({
    required this.icon,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.cyanAccent, size: 26),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  )),
              const SizedBox(height: 8),
              Text(
                text,
                style: const TextStyle(color: Colors.white70, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CTABand extends StatelessWidget {
  final bool isTablet;
  final bool isMobile;
  const _CTABand({required this.isTablet, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return _GlassCard(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 18 : 22,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment:
        isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Text(
              'Ready to transform your vision into reality?',
              style: TextStyle(
                color: Colors.white,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (!isMobile) const SizedBox(width: 16) else const SizedBox(height: 12),
          FilledButton.tonal(
            style: ButtonStyle(
              backgroundColor:
              WidgetStateProperty.all(Colors.cyanAccent.withOpacity(0.15)),
              foregroundColor:
              WidgetStateProperty.all(Colors.cyanAccent.shade100),
              overlayColor:
              WidgetStateProperty.all(Colors.cyanAccent.withOpacity(0.2)),
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(
                  horizontal: isTablet ? 18 : 16,
                  vertical: 14,
                ),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            onPressed: () {
              // TODO: hook up to your contact section/route
              // Navigator.pushNamed(context, '/contact');
            },
            child: const Text('Let’s Build Together'),
          ),
        ],
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const _GlassCard({required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F0F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x6600FFFF),
            blurRadius: 16,
            spreadRadius: -6,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}
