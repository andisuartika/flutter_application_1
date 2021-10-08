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
          Text(
            product.kategori,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300
            ),
          ),
          Text(
            product.deskripsi,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            "\Rp.${product.harga}",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 15),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.shopping_cart_rounded),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsetsDirectional.only(top: 15),
                  height: 45,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}