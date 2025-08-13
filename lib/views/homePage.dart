import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/about_section.dart';
import '../widgets/header.dart';
import '../widgets/hero_section.dart';
import '../widgets/services.dart';
import '../widgets/footer.dart';
import '../widgets/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Drawer for mobile view
      endDrawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Image.asset(
                  'assets/images/company_logo.png',
                  fit: BoxFit.contain,
                ),
              ),

              // Home
              _DrawerMenuItem(
                title: 'Home',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // Services
              _DrawerMenuItem(
                title: 'Services',
                icon: Icons.design_services,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // About
              _DrawerMenuItem(
                title: 'About',
                icon: Icons.info,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              // Contact
              _DrawerMenuItem(
                title: 'Contact',
                icon: Icons.contact_mail,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),

        body: const ResponsiveLayout(
        mobile: MobileHomeView(),
        tablet: TabletHomeView(),
        desktop: DesktopHomeView(),
      ),
    );
  }
}

class MobileHomeView extends StatelessWidget {
  const MobileHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(isMobile: true), // now with hamburger icon
          HeroSection(isMobile: true),
          AboutSection(),
          ServicesSection(isMobile: true),
          Footer(),
        ],
      ),
    );
  }
}

class TabletHomeView extends StatelessWidget {
  const TabletHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
          HeroSection(),
          AboutSection(),
          ServicesSection(),
          Footer(),
        ],
      ),
    );
  }
}

class DesktopHomeView extends StatelessWidget {
  const DesktopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Header(),
          HeroSection(),
          AboutSection(),
          ServicesSection(),
          Footer(),
        ],
      ),
    );
  }
}


/// Custom Menu Item styled like Service Card
class _DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(color: Colors.blue.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blue.shade700),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}