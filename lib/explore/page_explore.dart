import 'package:flutter/material.dart';

import 'section_header_picker.dart';

class Section {
  final String name;
  final List<Cell> cells;

  Section(this.name, this.cells);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Section &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          cells == other.cells;

  @override
  int get hashCode => name.hashCode ^ cells.hashCode;
}

class Cell {
  final String imageUrl;
  final String city;
  final String country;
  final int availableFlights;

  Cell(this.city, this.country, this.imageUrl, this.availableFlights);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cell &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          city == other.city &&
          country == other.country &&
          availableFlights == other.availableFlights;

  @override
  int get hashCode =>
      imageUrl.hashCode ^
      city.hashCode ^
      country.hashCode ^
      availableFlights.hashCode;
}

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
  final double _cellHeight = 160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size.fromHeight(8.0),
        ),
        body: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            children: <Widget>[
              SectionHeaderPicker(
                  sections.map((section) => section.name).toList(),
                  _controller,
                  (sectionIndex) {}),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: sections.length,
                  itemBuilder: (context, index) {
                    return _buildSectionPage(index);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  ///
  /// Builds on section
  ///
  Widget _buildSectionPage(int sectionIndex) {
    var section = sections[sectionIndex];
    var itemCount = section.cells.length;
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _buildSectionCell(
            context, section.cells[index], index, itemCount);
      },
      itemCount: itemCount,
      padding: EdgeInsets.only(left: 36.0, right: 8.0, top: 16.0),
      itemExtent: _cellHeight,
      physics: AlwaysScrollableScrollPhysics(),
    );
  }

  ///
  /// Builds on cell based on the given index
  ///
  Widget _buildSectionCell(
      BuildContext context, Cell cell, int index, int itemCount) {
    var last = itemCount == index + 1;
    var imageLeft = index % 2 == 0;

    var contentWidgets = <Widget>[
      Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              shape: BoxShape.rectangle,
              boxShadow: [
                new BoxShadow(
                    color: Color.fromRGBO(50, 50, 50, 0.2), blurRadius: 4.0),
              ]),
          child: _buildSectionCellInfo(context, cell)),
    ];

    contentWidgets.insert(imageLeft ? 0 : contentWidgets.length,
        _buildSectionCellImage(context, cell));

    return Container(
      margin: !last ? EdgeInsets.only(bottom: 24.0) : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: contentWidgets,
      ),
    );
  }

  ///
  /// The image of each cell
  ///
  Widget _buildSectionCellImage(BuildContext context, Cell cell) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox.fromSize(
        size: Size.fromWidth(92),
        child: FittedBox(
          alignment: Alignment.center,
          fit: BoxFit.cover,
          child:
              Image.network("${cell.imageUrl}?dl&fit=crop&crop=entropy&w=480"),
        ),
      ),
    );
  }

  ///
  /// The text content of each cell
  ///
  Widget _buildSectionCellInfo(BuildContext context, Cell cell) {
    return Container(
      width: 180.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        color: Color.fromRGBO(0, 0, 0, 0.02),
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              cell.city,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              cell.country,
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(24.0),
            ),
            Text(
              "${cell.availableFlights} flights everyday",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
    );
  }
}
