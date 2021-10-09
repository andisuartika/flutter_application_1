import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/errormsg.dart';
import 'package:flutter_application_1/Service/apiService.dart';
import 'package:flutter_application_1/UI/product/product_screen.dart';
import 'package:flutter_application_1/Widget/Components/rounded_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:image_picker/image_picker.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formProductKey=GlobalKey<FormState>();
  late TextEditingController   nama, kategori, deskripsi, harga, stok;
  late ErrorMSG response;
  late bool _success=false;

   void initState() {
    nama = TextEditingController();
    kategori= TextEditingController();
    deskripsi= TextEditingController();
    harga= TextEditingController();
    stok= TextEditingController();
  }

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File? img;
  gallery() async{
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  // validasi
  String? validator(String value) {
    if (value.isEmpty){
      return "tidak boleh kosong";
    }else {
      return null;
    }
  }

  

  Future save() async{
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: Text("Proccessing"),
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 4,),
                Text("Loading..."),
              ],
            ),
          ),
        );
      }
    );

    if(_formProductKey.currentState!.validate()){      
      _formProductKey.currentState!.save();
      var params =  {
          'nama':nama.text.toString(),
          'kategori':kategori.text,
          'deskripsi' : deskripsi.text.toString(),
          'harga' : harga.text,
          'stok' : stok.text,
        }; 
        response=await APIService.saveProduct(params,image!.path);
        _success=response.success;
        final snackBar = SnackBar(content: Text(response.message),);        
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        if (_success) {
          print("success");
          Navigator.push(context,MaterialPageRoute(
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
            TextField(
              controller: nama,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Product Name"
              ),
            ),
            TextField(
              controller: kategori,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Category"
              ),
            ),
            TextField(
              controller: deskripsi,
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Product Description"
              ),
            ),
            TextField(
              controller: harga,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Price"
              ),
            ),
            TextField(
              controller: stok,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Stock"
              ),
            ),
            SizedBox(height: 16,),
            InkWell(
              onTap: gallery,
              child: image==null ? Image.asset(
                "asset/images/imgPlaceholder.png",
                fit: BoxFit.cover,
              ) : Image.file(
                File(image!.path),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16,),
            RoundedButton(
              text: "Save Product", 
              press: (){
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