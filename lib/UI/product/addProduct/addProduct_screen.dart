import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

import 'body/body.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({ Key? key }) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: kPrimaryColor,
      ),
      body: Body(),
    );
  }
}