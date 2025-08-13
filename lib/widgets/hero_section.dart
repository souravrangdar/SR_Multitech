import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({this.isMobile = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 400 : 500,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/company_background_image.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // Overlay to make text readable
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(24),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 700 || isMobile) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@SR_Multitech',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TyperAnimatedText(
                        'We create modern, fast & scalable applications for mobile, web, and desktop.',
                        textStyle: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: Colors.white70,
                        ),
                        speed: const Duration(milliseconds: 60),
                      ),
                    ],
                  ),
                ],
              );
            }

            return Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '@SR_Multitech',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            'We create modern, fast & scalable applications for mobile, web, and desktop.',
                            textStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                            speed: Duration(milliseconds: 60),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.devices,
                        size: 100,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
