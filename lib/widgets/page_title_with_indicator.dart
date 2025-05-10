// import 'package:flutter/material.dart';

// class StepProgressIndicator extends StatelessWidget {
//   final String title;
//   final double indicatorWidth;
//   final double indicatorHeight;
//   final double titleFontSize;
//   final int currentStep;
//   final int totalSteps;

//   const StepProgressIndicator({
//     Key? key,
//     required this.title,
//     this.indicatorWidth = 350.0,
//     this.indicatorHeight = 4.0,
//     this.titleFontSize = 24.0,
//     required this.currentStep,
//     required this.totalSteps,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Calculate progress as a fraction
//     final progress = currentStep / totalSteps;
    
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           style: TextStyle(
//             fontSize: titleFontSize,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Stack(
//           children: [
//             // Background bar (gray track)
//             Container(
//               width: indicatorWidth,
//               height: indicatorHeight,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             // Progress indicator (colored portion)
//             Container(
//               width: indicatorWidth * progress,
//               height: indicatorHeight,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF5159FF), // Blue-purple color
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class PageTitleWithIndicator extends StatelessWidget {
  final double indicatorWidth; // width of the purple segment
  final double lineWidth; // total width of the line
  final double positionFactor; // 0.0 (start) to 1.0 (end) for dynamic positioning
  final Color indicatorColor;
  final String title;
  final double titleFontSize;

  const PageTitleWithIndicator({
    Key? key,
    this.indicatorWidth = 50.0,
    this.lineWidth = 200.0,
    this.positionFactor = 0.5,
    this.indicatorColor = const Color(0xFF5159FF),
    this.title = 'placeholder',
    this.titleFontSize = 24.0
  }) : super(key: key);

  @override
  @override
Widget build(BuildContext context) {
  final double leftOffset = (lineWidth - indicatorWidth) * positionFactor;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: titleFontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      SizedBox(height: 8), // spacing between text and line
      SizedBox(
        width: lineWidth,
        height: 10,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 2,
                  color: Colors.grey[300],
                ),
              ),
            ),
            Positioned(
              left: leftOffset,
              top: 2.5,
              child: Container(
                width: indicatorWidth,
                height: 5,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
}
