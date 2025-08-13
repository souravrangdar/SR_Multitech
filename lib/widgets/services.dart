import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  final bool isMobile;
  const ServicesSection({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobileView = constraints.maxWidth < 700;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Services',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Wrap(

                  spacing: 20,
                  runSpacing: 20,
                  children: const [
                    ServiceCard(
                      title: 'Android App Development',
                      icon: Icons.phone_android,
                    ),
                    ServiceCard(
                      title: 'Web Development',
                      icon: Icons.web,
                    ),
                    ServiceCard(
                      title: 'Desktop App Development',
                      icon: Icons.computer_outlined,
                    ),
                    ServiceCard(
                      title: 'Backend Application Development',
                      icon: Icons.cloud_outlined,
                    ),
                    ServiceCard(
                      title: 'Ecommerce Solutions',
                      icon: Icons.shopping_cart_outlined,
                    ),
                    ServiceCard(
                      title: 'Property Management Solutions',
                      icon: Icons.home_work_outlined,
                    ),
                    ServiceCard(
                      title: 'Task Management Solutions',
                      icon: Icons.task_outlined,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceCard({required this.title, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 240, maxWidth: 320),
      child: Container(
        padding: const EdgeInsets.all(20),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 42, color: Colors.cyanAccent),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
