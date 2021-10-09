import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:flutter_application_1/constants.dart';

import 'components/body.dart';

class DetailScreeen extends StatelessWidget {
  final Product product;

  const DetailScreeen(
    {Key? key, required this.product}
  ) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Body(
        product: product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: IconButton(
        padding: EdgeInsets.only(left: kDefaulPadding),
        color: Colors.white,
        icon: Icon(Icons.arrow_back_rounded),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          padding: EdgeInsets.only(right: kDefaulPadding),
          onPressed: (){},
          icon: Icon(Icons.favorite_border)
        )
      ],
    );
  }
}
