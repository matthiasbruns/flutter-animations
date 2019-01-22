import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/destination_detail.dart';
import 'package:flutter_animations/explore/section.dart';

class DestinationDetailAnimator extends StatefulWidget {
  final Destination destination;

  const DestinationDetailAnimator({Key key, this.destination})
      : super(key: key);

  @override
  _DestinationDetailAnimatorState createState() {
    return new _DestinationDetailAnimatorState();
  }
}

class _DestinationDetailAnimatorState extends State<DestinationDetailAnimator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DestinationDetailWidget(
      destination: widget.destination,
      controller: _controller,
    );
  }
}
