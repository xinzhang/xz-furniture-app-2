import 'dart:convert';

import 'package:xz_furniture_app_2/models/Product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  const String apiUrl =
      "https://5f26b5610824d8001655ea9f.mockapi.io/furniture-products";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    List<Product> categories = (json.decode(response.body) as List)
        .map((data) => Product.fromJson(data))
        .toList();
    return categories;
  } else {
    throw Exception("Failed to load products");
  }
}
