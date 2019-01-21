import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _imageHero(context),
            _destinationOverview(context),
          ],
        ),
      ),
    );
  }

  Widget _imageHero(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(300),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.longArrowAltLeft,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Expanded(
            child: Hero(
              tag: "hero_${destination.tag}",
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                child: Image.network(
                    "${destination.imageUrl}?dl&fit=crop&crop=entropy&w=480"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _destinationOverview(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 80),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            destination.city,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            destination.country,
            style: Theme.of(context).textTheme.subhead,
          ),
          Text(
            "${destination.availableFlights} flights everyday",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
