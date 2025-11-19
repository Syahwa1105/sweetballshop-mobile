import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  String pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  String name;
  int price;
  String description;
  String thumbnail;
  String category;
  bool isFeatured;
  int user;

  // dummy_field bisa null → jadi dynamic
  dynamic dummyField;

  Fields({
    required this.name,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.category,
    required this.isFeatured,
    required this.user,
    this.dummyField,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    price: json["price"],
    description: json["description"],
    thumbnail: json["thumbnail"],
    category: json["category"],
    isFeatured: json["is_featured"],
    user: json["user"],
    dummyField: json["dummy_field"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "category": category,
    "is_featured": isFeatured,
    "user": user,
    "dummy_field": dummyField,
  };
}
