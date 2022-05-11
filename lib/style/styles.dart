import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const primary = Color(0xFF6EDBE7);
const green = Color(0xFF27C9A3);
const orange = Color(0xFFFFA200);
const whiteText = Color(0xFFF2F2F2);
const blacktext = Color(0xFF191919);
const darkgrey = Color(0xFF7E8EAA);
const colorblack = Color(0xFF394047);
const red = Color(0xFFFF3737);
const border = Color(0xFF707070);

TextStyle textStylesmBlackbPR() {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15.0,
    color: blacktext.withOpacity(0.51),
    fontFamily: 'PoppinsRegular',
  );
}

TextStyle hintStylesmBlackbPR() {
  return const TextStyle(
    fontWeight: FontWeight.w100,
    color: Colors.black45,
  );
}

BorderSide borderSideStyle() {
  return BorderSide(
    color: border.withOpacity(0.29),
    style: BorderStyle.none,
  );
}

TextStyle hintStylewhitetextPSB() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: Colors.white,
    fontFamily: 'PoppinsSemiBold',
  );
}

TextStyle hintStyleblacktextPSB() {
  return const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: Colors.black,
    fontFamily: 'PoppinsSemiBold',
  );
}

TextStyle listTileTitleStyle() {
  return const TextStyle(
    fontSize: 14.0,
    fontFamily: "PoppinsMedium",
    fontStyle: FontStyle.normal,
    color: Colors.black,
    letterSpacing: 0.6,
    fontWeight: FontWeight.w400,
  );
}
