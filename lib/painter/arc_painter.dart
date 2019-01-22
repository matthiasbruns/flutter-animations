import 'dart:math';

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  final Point start;
  final Point end;

  ArcPainter(this.start, this.end);

  @override
  void paint(Canvas canvas, Size size) {
    Offset startPx =
        Offset(start.x * size.width + 6, start.y * size.height + 2);
    Offset endPx = Offset(end.x * size.width + 8, end.y * size.height + 4);
    Offset centerCtrl =
        Offset((startPx.dx + endPx.dx) / 2, min(startPx.dy, endPx.dy));

    Path curve = Path()
      ..moveTo(startPx.dx, startPx.dy)
      ..quadraticBezierTo(centerCtrl.dx, centerCtrl.dy, endPx.dx, endPx.dy);

    canvas.drawPath(
        curve,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2
          ..isAntiAlias = true
          ..color = Colors.white.withAlpha(150));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
