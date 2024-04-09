import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientScreen extends StatelessWidget {
  const GradientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [.02, 0.7],
            colors: [
              Color.fromRGBO(56, 28, 92, 1),
              Color.fromRGBO(24, 4, 44, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              // top: 100,
              right: 0,
              child: CustomPaint(
                size: const Size(229, 191),
                painter: GradientCustomClass(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GradientCustomClass extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = ui.Gradient.linear(
        const Offset(105, 100),
        Offset(105, size.height),
        [
          const Color.fromARGB(224, 56, 28, 92),
          const Color.fromRGBO(56, 28, 92, 0)
        ],
      );
    Path path = Path()..moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(131, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
