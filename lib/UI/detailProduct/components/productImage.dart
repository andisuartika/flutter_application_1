import 'package:flutter/material.dart';
import 'package:flutter_application_1/Service/apiService.dart';

import '../../../constants.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key ? key,
    required this.size, 
    required this.gambar,
  }) : super(key: key);

  final Size size;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaulPadding/4),
      height: size.width * 0.7,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: size.width * 0.6,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              color:kPrimaryLightColor,
              shape: BoxShape.circle
            ),
          ),
          Transform.rotate(angle: -180 / 360,
            child: Image.network(
              APIService.hostStorage+gambar,
              height: size.width * 0.8,
              width: size.width * 0.8,
              fit: BoxFit.cover,
              ),
          )
        ],
      ),
    );
  }
}