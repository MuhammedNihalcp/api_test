class ApiModel2 {
    ApiModel2({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.images,
        required this.creationAt,
        required this.updatedAt,
        required this.category,
    });

    final int id;
    final String title;
    final int price;
    final String description;
    final List<String> images;
    final DateTime creationAt;
    final DateTime updatedAt;
    final Category2 category;

    factory ApiModel2.fromJson(Map<String, dynamic> json) => ApiModel2(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        category: Category2.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "category": category.toJson(),
    };
}

class Category2 {
    Category2({
        required this.id,
        required this.name,
        required this.image,
        required this.creationAt,
        required this.updatedAt,
    });

    final int id;
    final Name name;
    final String image;
    final DateTime creationAt;
    final DateTime updatedAt;

    factory Category2.fromJson(Map<String, dynamic> json) => Category2(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum Name { CHANGE_TITLE, OTHERS, ELECTRONICS, CLOTHES, SHOES }

final nameValues = EnumValues({
    "Change title": Name.CHANGE_TITLE,
    "Clothes": Name.CLOTHES,
    "Electronics": Name.ELECTRONICS,
    "Others": Name.OTHERS,
    "Shoes": Name.SHOES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
