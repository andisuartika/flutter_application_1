import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'colorDot.dart';

class ListOfColors extends StatelessWidget {
  const ListOfColors({
    Key ? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaulPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ColorDot(
            fillColor: Color(0xFFd62828),
            isSelected: true,
          ),
          ColorDot(
            fillColor: Color(0xFF0a9396),
          ),
          ColorDot(
            fillColor: Color(0xFF6c757d),
          ),
        ],
      ),
    );
  }
}