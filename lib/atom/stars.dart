import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarrySky extends StatelessWidget {
  final Widget _placeWithin;
  static const int _AMOUNT_STARS = 250;

  StarrySky(final this._placeWithin);

  Widget _generateStars(BuildContext context) {
    List stars = <Widget>[];
    Random random = new Random();
    num screenWidth = MediaQuery.of(context).size.width;
    num screenHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < _AMOUNT_STARS; i++) {
      stars.add(Positioned(
          left: random.nextDouble() * screenWidth,
          top: random.nextDouble() * screenHeight,
          child: Transform.rotate(
            angle: random.nextDouble(),
            child: new Icon(
              Icons.star,
              color: Colors.white,
              size: random.nextDouble() * 3.3,
            ),
          )));
    }
    return Stack(
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(transform: GradientRotation(60), colors: [
            Color.fromRGBO(20, 5, 20, 1),
            Color.fromRGBO(32, 11, 37, 1),
            Color.fromRGBO(42, 19, 47, 1),
            Color.fromRGBO(42, 19, 47, 1),
            Color.fromRGBO(32, 11, 37, 1),
            Color.fromRGBO(20, 5, 20, 1),
          ])),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0,0.4],
                  transform: GradientRotation(150),
                  colors: [
                    Color.fromRGBO(20, 5, 20, 1),
                    Color.fromRGBO(20, 5, 20, 0),
                  ])),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0,0.6],
                  transform: GradientRotation(240),
                  colors: [
                    Color.fromRGBO(20, 5, 20, 1),
                    Color.fromRGBO(20, 5, 20, 0),
                  ])),
        ),
        Container(
          child: _generateStars(context),
        ),
        Container(
          child: Container()
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: CustomPaint(
            painter: LandscapePainter(),
          ),
        ),
        Center(
          child: this._placeWithin,
        )
      ],
    );
  }
}


class LandscapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;
    Paint paint = new Paint()
      ..shader = LinearGradient(colors: [
        Color.fromRGBO(255, 255, 10, 1),
        Color.fromRGBO(0,0,0, 1)
      ], transform: GradientRotation(0))
          .createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = new Path();
    path.moveTo(0, size.height * 0.88);
    path.quadraticBezierTo(size.width * 0.87, size.height * 0.91,
        size.width * 1.0, size.height * 0.92);
    path.lineTo(size.width * 1, size.height * 1);
    path.lineTo(size.width * 0, size.height * 1);
    canvas.drawPath(path, paint);

    paint = new Paint()
      ..shader = LinearGradient(colors: [
        Color.fromRGBO(4, 10, 10, 1),
        Color.fromRGBO(0,0,0, 1)
      ], transform: GradientRotation(0))
          .createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    path = new Path();
    path.moveTo(0, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.92);
    path.lineTo(size.width * 1, size.height * 1);
    path.lineTo(size.width * 0, size.height * 1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
