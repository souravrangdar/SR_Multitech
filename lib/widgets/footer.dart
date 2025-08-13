import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          // Company name
          Text(
            '@SR_Multitech',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              shadows: [
                Shadow(
                  color: Colors.cyanAccent.withOpacity(0.6),
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Social icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _SocialIcon(
                icon: Icons.facebook,
                url: 'https://facebook.com/SouravRangdar',
              ),
              _SocialIcon(
                icon: Icons.email,
                url: 'mailto:souravrangdar98@gmail.com',
              ),
              _SocialIcon(
                icon: Icons.phone,
                url: 'tel:+916296548978',
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Copyright
          const Text(
            '© 2025 SR_Multitech. All rights reserved.',
            style: TextStyle(color: Colors.white70, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(
          icon,
          color: Colors.cyanAccent,
          size: 26,
        ),
      ),
    );
  }
}
