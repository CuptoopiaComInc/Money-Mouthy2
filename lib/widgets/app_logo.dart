import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double logoSize;
  final double titleFontSize;
  final double taglineFontSize;
  
  const AppLogo({
    Key? key,
    this.logoSize = 100,
    this.titleFontSize = 18,
    this.taglineFontSize = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // App Logo
        Container(
          width: logoSize,
          height: logoSize,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 177, 175, 175),
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/money_mouth.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        // App Name
        Text(
          "Money Mouthy",
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        // Tagline
        Text(
          "Meaningful Microblogging",
          style: TextStyle(
            fontSize: taglineFontSize,
            color: const Color(0xFF5159FF),
          ),
        ),
      ],
    );
  }
}