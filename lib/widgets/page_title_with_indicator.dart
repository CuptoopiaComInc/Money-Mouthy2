import 'package:flutter/material.dart';

class PageTitleWithIndicator extends StatelessWidget {
  final String title;
  final double indicatorWidth;
  final double indicatorHeight;
  final double titleFontSize;
  final double progress; // 0.0 to 1.0

  const PageTitleWithIndicator({
    Key? key,
    required this.title,
    this.indicatorWidth = 200.0,
    this.indicatorHeight = 4.0,
    this.titleFontSize = 20.0,
    this.progress = 0.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            // Background bar
            Container(
              width: indicatorWidth,
              height: indicatorHeight,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            // Foreground progress
            Container(
              width: indicatorWidth * progress,
              height: indicatorHeight,
              decoration: BoxDecoration(
                color: const Color(0xFF5159FF),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
