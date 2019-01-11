import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'section.dart';

class SectionView extends StatefulWidget {
  final Section section;
  static const double _cellHeight = 160;
  static const double _imageWidth = 92;

  SectionView(this.section) : super(key: ObjectKey(section));

  @override
  _SectionViewState createState() {
    return new _SectionViewState();
  }
}

class _SectionViewState extends State<SectionView>
    with SingleTickerProviderStateMixin {
  static const double DEFAULT_ITEM_SPACING = 12.0;

  ScrollController _scrollController;
  AnimationController _itemSpacingController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _itemSpacingController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 0.75,
      value: 0,
      duration: Duration(milliseconds: 150),
    )..addListener(() {
        setState(() {});
      });

    _itemSpacingController.reverse();
  }

  @override
  void dispose() {
    _itemSpacingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildSectionPage();
  }

  /// https://medium.com/@diegoveloper/flutter-lets-know-the-scrollcontroller-and-scrollnotification-652b2685a4ac
  bool _onScroll(ScrollNotification notification) {
    // TODO react on deacceleration
    if (notification is UserScrollNotification) {
      print(notification);
      if (notification.direction == ScrollDirection.idle) {
        _itemSpacingController.reverse();
      } else {
        _itemSpacingController.forward();
      }
    }

    return false;
  }

  ///
  /// Builds on section
  ///
  Widget _buildSectionPage() {
    var section = widget.section;
    var itemCount = section.cells.length;
    return NotificationListener<ScrollNotification>(
      onNotification: _onScroll,
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          return _buildSectionCell(
              context, section.cells[index], index, itemCount);
        },
        itemCount: itemCount,
        padding: EdgeInsets.only(right: 8.0, top: 16.0),
        itemExtent: SectionView._cellHeight +
            (1.0 + _itemSpacingController.value) * DEFAULT_ITEM_SPACING,
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );
  }

  ///w
  /// Builds on cell based on the given index
  ///
  Widget _buildSectionCell(
      BuildContext context, Cell cell, int index, int itemCount) {
    var last = false;
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

    print(_itemSpacingController.value);

    return Container(
      margin: EdgeInsets.only(
          bottom: (1.0 + _itemSpacingController.value) * DEFAULT_ITEM_SPACING),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
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
        size: Size.fromWidth(SectionView._imageWidth),
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
      width: MediaQuery.of(context).size.width - SectionView._imageWidth - 60,
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
