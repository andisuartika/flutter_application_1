import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:flutter_application_1/Service/apiStatic.dart';
import 'package:flutter_application_1/UI/detailProduct/detailScreen.dart';
import 'package:flutter_application_1/UI/home/components/productCard.dart';
import 'package:flutter_application_1/constants.dart';

import 'categories.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Heading(),
        SearchBox(),
        CategoryList(),
        SizedBox(height: 10),
        Expanded(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )
                ),
              ),
              FutureBuilder<List<Product>>(
                future: ApiStatic.getProduct(),
                builder: (context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    List<Product> products=snapshot.data;
                    return Container(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductCard(
                          itemIndex: index,
                          product: products[index],
                          press: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => DetailScreeen(
                                  product: products[index],
                                )
                              )
                            );
                          },
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          )
        )
      ],
    );
  }
}


class SearchBox extends StatelessWidget {
  const SearchBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaulPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaulPadding,),
      decoration: BoxDecoration(
        color: kSecondaryLightColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          icon: Icon(Icons.search),
          hintText: "Search.."
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(kDefaulPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Best Product",
            style: TextStyle(
              fontFamily: "OpenSans", 
              fontWeight: FontWeight.w700,
              fontSize: 24
              ),
            ),
          Text(
            "Perfect Choice!",
            style: TextStyle(
              fontSize: 16
            ),
          ),
        ],
      ),
    );
  }
}