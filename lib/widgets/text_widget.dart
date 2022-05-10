import 'package:flutter/material.dart';
import '../style/styles.dart';

class TextWidget extends StatefulWidget {
  final String hintText;
  final Function(String)? onChangedFunction;
  final TextEditingController controller;

  const TextWidget(
      {Key? key,
      required this.hintText,
      required this.onChangedFunction,
      required this.controller})
      : super(key: key);

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: const EdgeInsets.only(top: 15.0),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.hintText,
          alignLabelWithHint: true,
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          hintStyle: hintStylesmBlackbPR(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 12.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: borderSideStyle(),
          ),
        ),
        onChanged: widget.onChangedFunction,
        style: textStylesmBlackbPR(),
      ),
    );
  }
}
