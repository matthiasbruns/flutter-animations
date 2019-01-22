import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/destination_detail_animator.dart';
import 'package:flutter_animations/explore/section.dart';

class DestinationDetailPage extends StatelessWidget {
  final Destination destination;

  const DestinationDetailPage({Key key, @required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(),
      ),
      body: DestinationDetailAnimator(
        destination: destination,
      ),
    );
  }
}
