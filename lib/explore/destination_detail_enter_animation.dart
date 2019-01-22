import 'package:flutter/material.dart';

class DestinationDetailsEnterAnimation {
  DestinationDetailsEnterAnimation(this.controller)
      : buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.050,
              0.350,
              curve: Curves.ease,
            ),
          ),
        ),
        flagOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.050,
              0.350,
              curve: Curves.ease,
            ),
          ),
        ),
        flightDetailOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.700,
              curve: Curves.ease,
            ),
          ),
        ),
        flightDetailOffsetY = Tween(begin: 60.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.400,
              curve: Curves.ease,
            ),
          ),
        ),
        destinationFactsOffsetY = Tween(begin: 60.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.500,
              curve: Curves.ease,
            ),
          ),
        ),
        destinationFactsOpacity = Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.900,
              curve: Curves.ease,
            ),
          ),
        ),
        flightArcOpacity = Tween(begin: 0.3, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.450,
              curve: Curves.ease,
            ),
          ),
        ),
        flightArcCurvePercentX = Tween(begin: 1.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.650,
              curve: Curves.easeOut,
            ),
          ),
        );

  final AnimationController controller;
  final Animation<double> buttonOpacity;
  final Animation<double> flagOpacity;
  final Animation<double> flightDetailOpacity;
  final Animation<double> flightDetailOffsetY;
  final Animation<double> destinationFactsOpacity;
  final Animation<double> destinationFactsOffsetY;
  final Animation<double> flightArcOpacity;
  final Animation<double> flightArcCurvePercentX;
}
