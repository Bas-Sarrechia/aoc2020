import 'package:flutter/cupertino.dart';

class PeachStreak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PeachPainter(),
    );
  }
}

class PeachPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect _rect = Offset.zero & size;
    Paint paint = new Paint()
      ..shader = LinearGradient(colors: [
        Color.fromRGBO(255, 179, 102, 1),
        Color.fromRGBO(240, 136, 135, 1)
      ]).createShader(_rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = new Path()
      ..moveTo(0, size.height * 0.1)
      ..lineTo(0, size.height * 0.9)
      ..lineTo(0.9 * size.width, 0)
      ..lineTo(0.1 * size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
