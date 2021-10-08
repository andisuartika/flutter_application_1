import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'descriptionProduct.dart';
import 'listOfColors.dart';
import 'productImage.dart';
import 'package:flutter_application_1/Models/Product/product.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({
    Key ? key,
    required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )
            ),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: '${product.id}',
                  child: ProductImage(
                    size: size, 
                    gambar: product.gambar,
                  )
                ),
                ListOfColors()
              ],
            ),
          ),
          DescriptionProduct(
            size: size,
            product: product,
          )
        ],
      ),
    );
  }
}







