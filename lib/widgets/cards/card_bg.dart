import 'package:flutter/material.dart';

class CardBg extends StatelessWidget {
  final Color color;
  const CardBg({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // need a custom card with a semi-circle at the top
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        CustomPaint(
          painter: CardBgPainter(color: color),
          child: Container(),
        ),
      ],
    );
  }
}

class CardBgPainter extends CustomPainter {
  final Color color;
  final double _kCurveHeight = 70;
  const CardBgPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height * 0.55;
    final width = size.width;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // draw a semi-circle at the top
    final path = Path();
    path.lineTo(0, height - _kCurveHeight);
    path.relativeQuadraticBezierTo(width / 2, 2 * _kCurveHeight, width, 0);
    path.lineTo(width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
