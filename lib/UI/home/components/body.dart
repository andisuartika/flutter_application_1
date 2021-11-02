import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Category/category.dart';
import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/detailProduct/detailScreen.dart';
import 'package:flutter_application_1/UI/home/components/productCard.dart';
import 'package:flutter_application_1/constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late List products = [];
  late int idKategori = 0;
  int selectedIndex = 0;
  late List categories = [];
  late TextEditingController search;

  Future<void> getCategory() async {
    final response = await APIService.getCategory();
    setState(() {
      categories = response.toList();
    });
  }

  Future<void> getProduct() async {
    final respose = await APIService.getProduct(search.text, idKategori);
    setState(() {
      products = respose.toList();
    });
  }

  @override
  void initState() {
    search = TextEditingController();
    getCategory();
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Heading(),
          Container(
            margin: EdgeInsets.all(kDefaulPadding),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaulPadding,
            ),
            decoration: BoxDecoration(
                color: kSecondaryLightColor,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: search,
              onChanged: (search) {
                setState(() {
                  getProduct();
                });
              },
              decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: Icon(
                    Icons.search,
                    color: kPrimaryColor,
                  ),
                  hintText: "Search.."),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: kDefaulPadding / 2),
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    idKategori = categories[index].id;
                    getProduct();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      left: kDefaulPadding,
                      right:
                          index == categories.length - 1 ? kDefaulPadding : 0),
                  padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
                  decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? kPrimaryLightColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    categories[index].kategori,
                    style: TextStyle(
                        color: index == selectedIndex
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ),
          ),
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
                    )),
              ),
              FutureBuilder<List<Product>>(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => ProductCard(
                          itemIndex: index,
                          product: products[index],
                          press: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailScreeen(
                                          product: products[index],
                                        )));
                          },
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ))
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaulPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Best Product",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
          Text(
            "Perfect Choice!",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
