class Product{
  final int id, harga;
  final String nama, brand, deskripsi, gambar;

  Product({this.id, this.harga,  this.nama, this.brand, this.deskripsi, this.gambar});

  factory Product.fromJson(Map<String, dynamic> json) =>Product(
    id: json['id'],
    harga: json['id'],
    nama: json['nama'].toString(),
    brand: json['brand'].toString(),
    deskripsi: json['deskripsi'].toString(),
    gambar: json['gambar'].toString(),
  );
}

// List<Product> products = [
//   Product(
//     id: 1,
//     harga: 2000000,
//     nama: "Nike Air Jordan Low",
//     brand: "Nike",
//     deskripsi: "Inspired by the original that debuted in 1985.",
//     gambar: "asset/product/nike1.png",
//   ),
//   Product(
//     id: 2,
//     harga: 4500000,
//     nama: "Yeezy Boost 350 V2 ",
//     brand: "Adidas",
//     deskripsi: "Inspired by the original that debuted in 1985.",
//     gambar: "asset/product/yeezy1.png",
//   ),
//   Product(
//     id: 3,
//     harga: 150000,
//     nama: "Converse Chuck Taylor",
//     brand: "Converse",
//     deskripsi: "Inspired by the original.",
//     gambar: "asset/product/converse1.png",
//   ),
// ];