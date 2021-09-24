import 'dart:convert';

import 'package:flutter_application_1/Models/Product/product.dart';
import 'package:http/http.dart' as http;

class ApiStatic{
  // static Future<List<Product>> getProduct() async{
  //   List<Product> 
  //   products = [
  //     Product(
  //       id: 1,
  //       harga: 2000000,
  //       nama: "Nike Air Jordan Low",
  //       kategori: "Nike",
  //       deskripsi: "Inspired by the original that debuted in 1985.",
  //       gambar: "asset/product/nike1.png",
  //     ),
  //     Product(
  //       id: 2,
  //       harga: 4500000,
  //       nama: "Yeezy Boost 350 V2 ",
  //       kategori: "Adidas",
  //       deskripsi: "Inspired by the original that debuted in 1985.",
  //       gambar: "asset/product/yeezy1.png",
  //     ),
  //     Product(
  //       id: 3,
  //       harga: 150000,
  //       nama: "Converse Chuck Taylor",
  //       kategori: "Converse",
  //       deskripsi: "Inspired by the original. Converse",
  //       gambar: "asset/product/converse1.png",
  //     ),
  //   ];
  //   return products;
  // }

  static final host= 'http://192.168.8.102/APIFlutter/public/';

  static Future<List<Product>> getProduct() async{
    
    try{
      final response = await http.get(Uri.parse(host+'api/product'));
      if(response.statusCode == 200){
        var json=jsonDecode(response.body);
        final parsed=json['data_product'].cast<Map<String, dynamic>>();
        return parsed.map<Product>((json)=>Product.fromJson(json)).toList();
      }else{
        return [];
      }
    }catch(e){
      return [];
    }

  }
}