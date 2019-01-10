import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SectionDots extends AnimatedWidget {
  final int sectionCount;
  final PageController controller;
  final ValueChanged<int> onPageSelected;

  SectionDots(this.sectionCount, this.controller, this.onPageSelected)
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      margin: EdgeInsets.only(left: 60),
      child: FittedBox(
        fit: BoxFit.fitHeight,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List<Widget>.generate(
              sectionCount, (index) => _buildTitle(context, index)),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, int index) {
    var selectedPage =
        controller.hasClients ? controller.page : controller.initialPage;
    var selected = selectedPage == index;
    return Container(
      padding: EdgeInsets.only(right: 24),
      child: selected
          ? Container(
              child: Icon(
                FontAwesomeIcons.solidCircle,
                color: Colors.blue,
              ),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 12)],
                  shape: BoxShape.circle),
            )
          : Icon(
              FontAwesomeIcons.solidCircle,
              color: Color.fromRGBO(50, 50, 50, 0.2),
            ),
    );
  }
}
