import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/product/detailProduct/detailProduct_screen.dart';
import 'package:flutter_application_1/Widget/Components/searchBox.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kSecondaryLightColor,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Tittle(),
                SearchBox(),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: APIService.getProductBySeller(),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                } else {
                  List<Product>  products=snapshot.data!;
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: kDefaulPadding),
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing:kDefaulPadding,
                        crossAxisSpacing:kDefaulPadding,
                      ),
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
                        )
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Container Tittle() {
    return Container(
        margin: EdgeInsets.only(top: kDefaulPadding, left: kDefaulPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Welcome, Seller!",
              style: TextStyle(
                fontFamily: "OpenSans", 
                fontWeight: FontWeight.w700,
                fontSize: 24
                ),
              ),
            Text(
              "Add Your best Product",
              style: TextStyle(
                fontSize: 16
              ),
            ),
          ],
        ),
      );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.itemIndex, 
    required this.product, 
    required this.press,
  }) : super(key: key);

  final int itemIndex;
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                APIService.hostStorage+product.gambar,
                fit: BoxFit.contain,
                height: 100,
              ),
              SizedBox(height: 10,),
              Text(
                product.nama,
                maxLines:1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "OpenSans", 
                  fontWeight: FontWeight.w700,
                  fontSize: 14
                ),
                ),
              Text(
                "\Rp. ${product.harga}",
                  style: TextStyle(
                    fontFamily: "OpenSans", 
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                ),
              Text(
                "\Stok ${product.stok}",
                 style: TextStyle(
                    fontFamily: "OpenSans", 
                    fontWeight: FontWeight.w500,
                    fontSize: 12
                  ),
                ),
            ],
          ),
        ),
    );
  }
}