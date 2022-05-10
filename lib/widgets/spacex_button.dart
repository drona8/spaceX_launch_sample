import 'package:flutter/material.dart';

import '../style/styles.dart';

class SpaceXButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const SpaceXButton(
      {required this.child,
      required this.onPressed,
      required this.isDisabled,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: MediaQuery.of(context).size.width * 0.17,
      height: MediaQuery.of(context).size.width * 0.17,
      decoration: BoxDecoration(
        color: isDisabled ? darkgrey : green,
        borderRadius: BorderRadius.circular(23.0),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
