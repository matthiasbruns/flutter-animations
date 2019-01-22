import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations/painter/arc_painter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlightArcWidget extends StatelessWidget {
  final Point start;
  final Point end;

  FlightArcWidget()
      : this.start = Point(0.33, 0.85),
        this.end = Point(0.8, 0.3);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = 180.0;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          colorFilter: ColorFilter.mode(Colors.red, BlendMode.lighten),
          image: NetworkImage(
              "https://static.vecteezy.com/system/resources/previews/000/144/399/large_2x/dotted-world-map-vector.jpg"),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                colors: [Color(0xAAD57FCE), Color(0xAA8181E1)],
              ),
            ),
          ),
          Positioned(
              left: width * start.x,
              top: height * start.y,
              child: _flightAirportDot()),
          Positioned(
              left: width * end.x,
              top: height * end.y,
              child: _flightAirportDot()),
          SizedBox(
            height: height,
            width: width,
            child: CustomPaint(
              painter: ArcPainter(start, end),
            ),
          )
        ],
      ),
    );
  }

  Container _flightAirportDot() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 3),
        ],
      ),
      child: Icon(
        FontAwesomeIcons.solidCircle,
        size: 8,
        color: Colors.white.withAlpha(150),
      ),
    );
  }
}
