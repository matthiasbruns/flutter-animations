import 'package:flutter/material.dart';
import 'package:flutter_animations/explore/section.dart';

class DestinationGalleryPage extends StatelessWidget {
  final int initialPage;
  final double imageSize = 64.0;
  final Destination destination;
  final PageController _galleryPageController;

  DestinationGalleryPage(
      {Key key, @required this.destination, this.initialPage: 0})
      : _galleryPageController = PageController(
          initialPage: initialPage,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemCount = 3;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PageView.builder(
          controller: _galleryPageController,
          itemBuilder: (context, index) {
            return Image.network(
                "${destination.galleryUrls[index]}?dl&fit=crop&crop=entropy&w=480");
          },
          itemCount: itemCount,
        ),
      ),
    );
  }
}
