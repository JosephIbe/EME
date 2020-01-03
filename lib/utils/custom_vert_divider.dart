import 'package:flutter/material.dart';

class MyVerticalDivider extends StatefulWidget {

  Color color;
  double height;
  double left;
  double right;

  MyVerticalDivider({this.color, this.height, this.left, this.right});

  @override
  _MyVerticalDividerState createState() => _MyVerticalDividerState();
}

class _MyVerticalDividerState extends State<MyVerticalDivider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.0,
      height: widget.height,
      color: widget.color,
      margin: EdgeInsets.only(left: widget.left, right: widget.right),
    );
  }
}

