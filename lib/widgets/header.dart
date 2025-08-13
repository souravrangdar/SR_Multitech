import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isMobile;
  const Header({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.black,
      child: isMobile
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Container(
            height: 100,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/company_logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Menu Icon that can open the Scaffold's drawer
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/company_logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Row(
            children: const [
              _NavItem('Home'),
              _NavItem('Services'),
              _NavItem('About'),
              _NavItem('Contact'),
            ],
          )
        ],
      ),//Web
    );
  }
}


class _NavItem extends StatelessWidget {
  final String title;
  const _NavItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
