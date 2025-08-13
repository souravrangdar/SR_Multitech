import 'package:flutter/material.dart';
import 'package:my_portfolio/views/homePage.dart';

void main() {
  runApp(const CompanyApp());
}

class CompanyApp extends StatelessWidget {
  const CompanyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Company',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
