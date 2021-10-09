class Category {
    Category({
        required this.id,
        required this.kategori,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String kategori;
    DateTime createdAt;
    dynamic updatedAt;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        kategori: json["kategori"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "kategori": kategori,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
    };
}