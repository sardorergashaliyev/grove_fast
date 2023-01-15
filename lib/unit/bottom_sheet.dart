import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4158333, size.height * 0.3568571);
    path0.lineTo(size.width * 0.4185000, size.height * 0.6431429);
    path0.lineTo(size.width * 0.5851667, size.height * 0.6431429);
    path0.quadraticBezierTo(size.width * 0.5846667, size.height * 0.4282143,
        size.width * 0.5845000, size.height * 0.3565714);
    path0.quadraticBezierTo(size.width * 0.5016667, size.height * 0.3006429,
        size.width * 0.4158333, size.height * 0.3568571);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
