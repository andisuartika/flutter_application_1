import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Category/category.dart';
import 'package:flutter_application_1/Models/errormsg.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/product/product_screen.dart';
import 'package:flutter_application_1/Widget/Components/rounded_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formProductKey = GlobalKey<FormState>();
  late TextEditingController nama, deskripsi, harga, stok;
  late ErrorMSG response;
  late bool _success = false;
  late List<Category> categories = [];
  late int idCategory = 0;

  void initState() {
    getCategory();
    nama = TextEditingController();
    deskripsi = TextEditingController();
    harga = TextEditingController();
    stok = TextEditingController();
  }

  void getCategory() async {
    final respose = await APIService.getCategory();
    setState(() {
      categories = respose.toList();
    });
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? img;
  gallery() async {
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  // validasi
  String? validator(String value) {
    if (value.isEmpty) {
      return "tidak boleh kosong";
    } else {
      return null;
    }
  }

  Future save() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Proccessing"),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 4,
                  ),
                  Text("Loading..."),
                ],
              ),
            ),
          );
        });

    if (_formProductKey.currentState!.validate()) {
      _formProductKey.currentState!.save();
      var params = {
        'nama': nama.text.toString(),
        'kategori': idCategory.toString(),
        'deskripsi': deskripsi.text.toString(),
        'harga': harga.text,
        'stok': stok.text,
      };
      response = await APIService.saveProduct(params, image!.path);
      _success = response.success;
      final snackBar = SnackBar(
        content: Text(response.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      if (_success) {
        print("success");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formProductKey,
        child: ListView(
          children: [
            TextFormField(
              controller: nama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Product Name",
                icon: Icon(Iconsax.box),
              ),
              validator: (value) => value == null ? 'Tidak boleh kosong' : null,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: DropdownButtonFormField(
                hint: Text("Select Category"),
                value: idCategory == 0 ? null : idCategory,
                decoration: const InputDecoration(
                  icon: Icon(Iconsax.category),
                  //hintText: 'Jeruk Bali',
                  //labelText: 'Jenis Komoditas *',
                ),
                items: categories.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.kategori),
                    value: item.id.toInt(),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    idCategory = value as int;
                  });
                },
                validator: (u) => u == null ? "Tidak boleh kosong" : null,
              ),
            ),
            TextFormField(
              controller: deskripsi,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Product Description",
                icon: Icon(Iconsax.additem),
              ),
              validator: (value) => value == null ? 'Tidak boleh kosong' : null,
            ),
            TextFormField(
              controller: harga,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price",
                icon: Icon(Iconsax.ticket),
              ),
              validator: (value) => value == null ? 'Tidak boleh kosong' : null,
            ),
            TextFormField(
              controller: stok,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Stock",
                icon: Icon(Iconsax.shopping_bag),
              ),
              validator: (value) => value == null ? 'Tidak boleh kosong' : null,
            ),
            SizedBox(
              height: 16,
            ),
            Text("Add Photos"),
            InkWell(
              onTap: gallery,
              child: image == null
                  ? Image.asset(
                      "asset/images/imgPlaceholder.png",
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(image!.path),
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              height: 16,
            ),
            RoundedButton(
              text: "Save Product",
              press: () {
                save();
              },
              color: kPrimaryColor,
            )
          ],
        ),
      ),
    );
  }
}
