import 'package:flutter/material.dart';

import 'section_header.dart';
import 'section_dots.dart';
import 'section.dart';
import 'section_view.dart';

List<Section> sections = <Section>[
  Section("Popular", <Cell>[
    Cell(
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39),
    Cell(
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41),
    Cell(
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39),
    Cell(
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41),
    Cell(
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39),
    Cell(
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41),
  ]),
  Section("Sea & Sun", <Cell>[
    Cell(
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39),
    Cell(
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41),
  ]),
  Section("Winter Fun", <Cell>[
    Cell(
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39),
    Cell(
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41),
  ]),
];

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
