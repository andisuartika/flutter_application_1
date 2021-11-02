import 'package:flutter/material.dart';

import '../../constants.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaulPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaulPadding,
      ),
      decoration: BoxDecoration(
          color: kSecondaryLightColor, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
            hintText: "Search.."),
      ),
    );
  }
}
