import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:flutter_application_1/Models/errormsg.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/detailProduct/components/descriptionProduct.dart';
import 'package:flutter_application_1/UI/detailProduct/components/listOfColors.dart';
import 'package:flutter_application_1/UI/detailProduct/components/productImage.dart';
import 'package:flutter_application_1/UI/main/main.dart';
import 'package:flutter_application_1/UI/product/editProduct/editProduct_screen.dart';


import '../../../../constants.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({
    Key ? key,
    required this.product,
  }) : super(key: key);

  deleteProduct() async{
    late ErrorMSG response;
    late bool _success=false;
    var id = product.id;
    
    response =await APIService.deleteProduct(id);
    _success=response.success;
    return _success;
  }

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
                ListOfColors(),
              ],
            ),
          ),
          DescriptionProduct(
            size: size,
            product: product,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                          builder: (context) => EditProduct(product: product)
                    ));
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 15),
                    height: 45,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Edit Product",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    deleteProduct() async{
                        late ErrorMSG response;
                        late bool _success=false;
                        var id = product.id;
                        
                        response =await APIService.deleteProduct(id);
                        _success=response.success;
                        if(_success){
                          Navigator.push(context,MaterialPageRoute(
                            builder: (context) => MainScreen(),
                            ));
                          final snackBar = SnackBar(content: Text("Product Deleted"),);        
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                      deleteProduct();                    
                  },
                  child: Container(
                    margin: EdgeInsetsDirectional.only(top: 15),
                    height: 45,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color(0xFFd62828),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        "Delete Product",
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
            ),
          )
        ],
      ),
    );
  }
}







