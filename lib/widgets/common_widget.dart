import 'package:flutter/material.dart';

import '../style/styles.dart';

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

  static Widget getResultRow(BuildContext context, String label, String data) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              label,
              style: hintStyleblacktextPSB(),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(child: Text(data)),
        ],
      ),
    );
  }

  static Widget circularProgressIndicator() {
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: orange,
        ),
      ),
    );
  }

  static Widget getResultRowList(
      BuildContext context, String label, List<String>? data) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              label,
              style: hintStyleblacktextPSB(),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(
              child: data != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (String d in data) Text(d),
                      ],
                    )
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
