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
          viewportFraction: 0.8,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemCount = destination.galleryUrls.length;
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      width: size.width,
      height: size.height,
      child: PageView.builder(
        controller: _galleryPageController,
        itemBuilder: (context, index) {
          var image = destination.galleryUrls[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0.0,
              horizontal: 8.0,
            ),
            child: Hero(
              tag: index == 0 ? "hero_${destination.tag}" : "hero_${image.hashCode}",
              child: Image.network(
                  "${destination.galleryUrls[index]}?dl&fit=crop&crop=entropy&w=480"),
            ),
          );
        },
        itemCount: itemCount,
      ),
    );
  }
}
