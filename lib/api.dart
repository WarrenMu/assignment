import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final Products = ProductsFromJson(jsonString);

import 'dart:convert';

Products ProductsFromJson(String str) => Products.fromJson(json.decode(str));

String ProductsToJson(Products data) => json.encode(data.toJson());

class Products {
    List<Product> products;
    int total;
    int skip;
    int limit;

    Products({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    int price;
    double discountPercentage;
    double rating;
    int stock;
    String brand;
    String category;
    String thumbnail;
    List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

List<Products> decodeProducts(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Products>((json) => Products.fromMap(json)).toList();
}


Future<List<Products>> callApi() async {
  final response =  await http.get(Uri.parse('https://dummyjson.com/products')
  );
  if (response.statusCode == 200){
    print("Data has been returned");
    return decodeProducts(response.body);
  }else{
    throw Exception("Unable to retrieve data from the api");
  }
  
}


