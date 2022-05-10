import 'package:flutter/material.dart';

class CommonWidget {
  static Widget getVariableHeightSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget getSizedBoxWithChild(
      double width, double height, Widget child) {
    return SizedBox(
      width: width,
      height: height,
      child: child,
    );
  }
}
