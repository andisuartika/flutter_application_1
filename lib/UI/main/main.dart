import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/profile/profile_screen.dart';
import 'package:flutter_application_1/UI/cart/cart_screen.dart';
import 'package:flutter_application_1/UI/home/homeScreen.dart';
import 'package:flutter_application_1/UI/product/product_screen.dart';

import '../../constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    CartScreen(),
    ProductScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  pageList[pageIndex],
        bottomNavigationBar: Container(
           decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, -5),
                )
              ]
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(color: kPrimaryColor),
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kSecondaryColor.withOpacity(0.5),
            currentIndex: pageIndex,
            onTap: (value){
              setState(() {
                pageIndex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon:  Icon(Icons.home),
                label: "Home",
                ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.shopping_cart),
                label: "Cart",
                ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.add_box),
                label: "Product",
                ),
              BottomNavigationBarItem(
                icon:  Icon(Icons.person),
                label: "Profile",
              ),
            ],
        ),
        ),
    );
  }
}