import 'package:flutter/material.dart';
import 'package:flutter_animations/data.dart';

import 'section_header.dart';
import 'section_dots.dart';
import 'section_view.dart';

/// Explore view from:
/// https://www.behance.net/gallery/55023357/Flyer-Flight-Booking
class ExplorerPage extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(8.0),
        ),
        body: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SectionHeader(sections.map((section) => section.name).toList(),
                    _controller, (sectionIndex) {}),
                SectionDots(sections.length, _controller, (sectionIndex) {}),
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: sections.length,
                    itemBuilder: (context, index) {
                      return SectionView(sections[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
