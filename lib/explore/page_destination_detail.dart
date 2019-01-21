import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/section.dart';

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;

  const DestinationDetailPage({Key key, @required this.destination}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Hero(
          tag: "hero_${destination.tag}",
          child: Image.network(
              "${destination.imageUrl}?dl&fit=crop&crop=entropy&w=480"),
        ),
      ),
    );
  }
}
