// class Product{
//   final int id, harga;
//   final String nama, kategori, deskripsi, gambar;

//   Product({this.id, this.harga,  this.nama, this.kategori, this.deskripsi, this.gambar});

//   factory Product.fromJson(Map<String, dynamic> json) =>Product(
//     id: json['id'],
//     harga: json['harga'],
//     nama: json['nama'].toString(),
//     kategori: json['kategori'].toString(),
//     deskripsi: json['deskripsi'].toString(),
//     gambar: json['gambar'].toString(),
//   );
// }

class Product {
    Product({
        this.id,
        this.nama,
        this.idKategori,
        this.deskripsi,
        this.harga,
        this.stok,
        this.gambar,
        this.createdAt,
        this.updatedAt,
        this.kategori,
    });

    int id;
    String nama;
    int idKategori;
    String deskripsi;
    int harga;
    int stok;
    String gambar;
    DateTime createdAt;
    dynamic updatedAt;
    String kategori;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        nama: json["nama"].toString(),
        idKategori: json["id_kategori"],
        deskripsi: json["deskripsi"].toString(),
        harga: json["harga"],
        stok: json["stok"],
        gambar: json["gambar"].toString(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        kategori: json["kategori"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_kategori": idKategori,
        "deskripsi": deskripsi,
        "harga": harga,
        "stok": stok,
        "gambar": gambar,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
        "kategori": kategori,
    };
}
