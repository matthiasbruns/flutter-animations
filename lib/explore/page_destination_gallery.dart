import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/section.dart';

class DestinationGalleryPage extends StatefulWidget {
  final int initialPage;
  final Destination destination;
  final PageController _galleryPageController;

  DestinationGalleryPage(
      {Key key, @required this.destination, this.initialPage: 0})
      : _galleryPageController = PageController(
          initialPage: initialPage,
          viewportFraction: 0.8,
        ),
        super(key: key);

  @override
  DestinationGalleryPageState createState() {
    return new DestinationGalleryPageState();
  }
}

class DestinationGalleryPageState extends State<DestinationGalleryPage> {
  final double imageSize = 64.0;
  final double dismissDelta = 120;
  final double dismissBarrier = 50;
  double currentDismissDelta = 0;

  @override
  Widget build(BuildContext context) {
    var itemCount = widget.destination.galleryUrls.length;
    var size = MediaQuery.of(context).size;
    var opacity = (1.0 - ((currentDismissDelta - dismissBarrier) / dismissDelta).clamp(0.0, 1.0);

    if (opacity < 0.3) {
      Navigator.of(context).pop();
      return Container();
    }

    return Opacity(
      opacity: opacity,
      child: Container(
        color: Colors.black,
        width: size.width,
        height: size.height,
        child: PageView.builder(
          controller: widget._galleryPageController,
          itemBuilder: (context, index) {
            var image = Image.network(
              "${widget.destination.galleryUrls[index]}?dl&fit=crop&crop=entropy&w=480",
            );
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 8.0,
              ),
              child: GestureDetector(
                child: image,
                onVerticalDragUpdate: (details) {
                  setState(
                    () {
                      currentDismissDelta += details.delta.dy;
                    },
                  );
                },
                onVerticalDragCancel: () {
                  setState(
                    () {
                      currentDismissDelta = 0.0;
                    },
                  );
                },
                onVerticalDragEnd: (details) {
                  setState(
                    () {
                      currentDismissDelta = 0.0;
                    },
                  );
                },
              ),
            );
          },
          itemCount: itemCount,
        ),
      ),
    );
  }
}
