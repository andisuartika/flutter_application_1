import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Product/product.dart';

import '../../../constants.dart';

class DescriptionProduct extends StatelessWidget {
  final Product product;
  const DescriptionProduct({
    Key ? key,
    required this.size, 
    required this.product,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaulPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.nama,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10),
          Text(
            product.deskripsi,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "\Rp. ${product.harga}",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}