import 'package:flutter/material.dart';

import 'section_header.dart';
import 'section_dots.dart';
import 'section.dart';
import 'section_view.dart';

List<Section> sections = <Section>[
  Section("Popular", <Destination>[
    Destination(
        "pop_us_ny",
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39,
        "http://flags.fmcdn.net/data/flags/w580/us.png"),
    Destination(
        "pop_fr_pa",
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41,
        "http://flags.fmcdn.net/data/flags/w580/fr.png"),
    Destination(
        "pop_us_ny_2",
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39,
        "http://flags.fmcdn.net/data/flags/w580/us.png"),
    Destination(
        "pop_fr_pa_ 2",
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41,
        "http://flags.fmcdn.net/data/flags/w580/fr.png"),
    Destination(
        "pop_us_ny_3",
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39,
        "http://flags.fmcdn.net/data/flags/w580/us.png"),
    Destination(
        "pop_fr_pa_ 3",
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41,
        "http://flags.fmcdn.net/data/flags/w580/fr.png"),
  ]),
  Section("Sea & Sun", <Destination>[
    Destination(
        "ss_us_ny_1",
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39,
        "http://flags.fmcdn.net/data/flags/w580/us.png"),
    Destination(
        "ss_fr_pa_1",
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41,
        "http://flags.fmcdn.net/data/flags/w580/fr.png"),
  ]),
  Section("Winter Fun", <Destination>[
    Destination(
        "wf_us_ny_1",
        "New York",
        "USA",
        "https://images.pexels.com/photos/1239162/pexels-photo-1239162.jpeg",
        39,
        "http://flags.fmcdn.net/data/flags/w580/us.png"),
    Destination(
        "wf_fr_pa_1",
        "Paris",
        "France",
        "https://images.pexels.com/photos/1461974/pexels-photo-1461974.jpeg",
        41,
        "http://flags.fmcdn.net/data/flags/w580/fr.png"),
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
