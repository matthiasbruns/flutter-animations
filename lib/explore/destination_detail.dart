import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/destination_detail_enter_animation.dart';
import 'package:flutter_animations/explore/flight_arc_widget.dart';
import 'package:flutter_animations/explore/page_destination_gallery.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_animations/explore/section.dart';

class DestinationDetailWidget extends StatelessWidget {
  final Destination destination;
  final DestinationDetailsEnterAnimation animation;

  DestinationDetailWidget(
      {Key key,
      @required this.destination,
      @required AnimationController controller})
      : animation = DestinationDetailsEnterAnimation(controller),
        super(key: key);

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _detailHead(context),
              SizedBox(height: 24),
              _destinationOverview(context),
              SizedBox(height: 24),
              Opacity(
                opacity: animation.flightArcOpacity.value,
                child: FlightArcWidget(animation),
              ),
              SizedBox(height: 24),
              _flightDetail(context),
              SizedBox(height: 24),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(height: 24),
              _destinationFacts(context)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: Container(),
      ),
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: _buildAnimation,
      ),
    );
  }

  Widget _detailHead(BuildContext context) {
    return SizedBox.fromSize(
      size: Size.fromHeight(200),
      child: Stack(
        children: <Widget>[
          _imageGallery(context),
          _floatingBackButton(context),
        ],
      ),
    );
  }

  Widget _floatingBackButton(BuildContext context) {
    return Padding(
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
    );
  }

  Widget _imageGallery(BuildContext context) {
    var itemCount = 1 + destination.galleryUrls.length;
    return SizedBox(
      height: 240,
      child: ListView.builder(
        itemBuilder: (context, index) {
          Widget imageWidget;
          if (index == 0) {
            imageWidget = SizedBox(width: 80.0);
          } else if (index == 1) {
            imageWidget = Hero(
              tag: "hero_${destination.tag}",
              placeholderBuilder: (context, child) {
                return child;
              },
              child: _galleryImage(
                  index, itemCount, context, destination.imageUrl),
            );
          } else {
            var image = destination.galleryUrls[index - 1];
            imageWidget = _galleryImage(index, itemCount, context, image);
          }
          return imageWidget;
        },
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
      ),
    );
  }

  Widget _galleryImage(
      int index, int itemCount, BuildContext context, String url) {
    return Padding(
      padding: EdgeInsets.only(
          right: (index < itemCount) ? 16.0 : 0.0,
          left: (index >= itemCount) ? 16.0 : 0.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return DestinationGalleryPage(
                  initialPage: index - 1,
                  destination: destination,
                );
              },
              fullscreenDialog: true,
            ),
          );
        },
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 80 - 40,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.center,
            child: Image.network("$url?dl&fit=crop&crop=entropy&w=480"),
          ),
        ),
      ),
    );
  }

  Widget _destinationOverview(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 80, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  destination.city,
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
              Opacity(
                opacity: animation.flagOpacity.value,
                child: SizedBox(
                    height: 16,
                    child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        child: Image.network(destination.flagUrl))),
              )
            ],
          ),
          SizedBox(height: 4),
          Text(
            destination.country,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "${destination.availableFlights} flights everyday",
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              _bookNowButton(context)
            ],
          ),
        ],
      ),
    );
  }

  /// https://stackoverflow.com/questions/52227846/how-can-i-add-shadow-to-the-widget-in-flutter
  /// https://stackoverflow.com/questions/45424621/inkwell-not-showing-ripple-effect
  Widget _bookNowButton(BuildContext context) {
    return Opacity(
      opacity: animation.buttonOpacity.value,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).buttonColor,
                blurRadius: 3,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Material(
          color: Theme.of(context).buttonColor,
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Book flight",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Tap'),
              ));
            },
          ),
        ),
      ),
    );
  }

  Widget _flightDetail(BuildContext context) {
    return Transform(
      transform:
          Matrix4.translationValues(0, animation.flightDetailOffsetY.value, 0),
      child: Opacity(
        opacity: animation.flightDetailOpacity.value,
        child: Container(
          margin: EdgeInsets.only(left: 80, right: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "3h 45m",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text("Direct flight"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "3120 km",
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text("Total distance"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _destinationFacts(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(
          0, animation.destinationFactsOffsetY.value, 0),
      child: Opacity(
        opacity: animation.destinationFactsOpacity.value,
        child: Padding(
          padding: const EdgeInsets.only(left: 80.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Facts",
                style: Theme.of(context).textTheme.headline,
              ),
              SizedBox(height: 12),
              Text(
                  "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"),
            ],
          ),
        ),
      ),
    );
  }
}
