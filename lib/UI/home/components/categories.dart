import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Category/category.dart';
import 'package:flutter_application_1/Service/apiService.dart';

import '../../../../constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  late List<Category> categories = [];
  @override
  void getCategory() async {
    final respose = await APIService.getCategory();
    setState(() {
      categories = respose.toList();
    });
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaulPadding / 2),
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: kDefaulPadding,
                right: index == categories.length - 1 ? kDefaulPadding : 0),
            padding: EdgeInsets.symmetric(horizontal: kDefaulPadding),
            decoration: BoxDecoration(
                color: index == selectedIndex
                    ? kPrimaryLightColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              categories[index].kategori,
              style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
