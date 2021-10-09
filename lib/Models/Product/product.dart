
class Product {
    Product({
        required this.id,
        required this.nama,
        required this.seller,
        required this.idKategori,
        required this.deskripsi,
        required this.harga,
        required this.stok,
        required this.gambar,
        required this.createdAt,
        required this.updatedAt,
        required this.kategori,
    });

    int id;
    String nama;
    int seller;
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
        seller: json["seller"],
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
        "seller": seller,
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
