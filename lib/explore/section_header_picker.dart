import 'package:flutter/material.dart';

class SectionHeaderPicker extends AnimatedWidget {
  static const double _textWidth = 180.0;
  final List<String> titles;
  final PageController controller;
  final ValueChanged<int> onPageSelected;

  SectionHeaderPicker(this.titles, this.controller, this.onPageSelected)
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    var selectedPage =
        controller.hasClients ? controller.page : controller.initialPage;

    return Container(
      height: 40.0,
      child: FittedBox(
        fit: BoxFit.none,
        alignment: Alignment.centerLeft,
        child: Container(
          transform: Matrix4.translationValues(selectedPage * -_textWidth, 0.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List<Widget>.generate(
                titles.length, (index) => _buildTitle(context, index)),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, int index) {
    var selectedPage =
        controller.hasClients ? controller.page : controller.initialPage;
    var selected = selectedPage == index;
    return Container(
      padding: EdgeInsets.only(left: 60),
      width: _textWidth,
      child: Text(
        "${titles[index]}",
        style: Theme.of(context)
            .textTheme
            .headline
            .copyWith(color: selected ? Colors.blue : Colors.black),
      ),
    );
  }
}
