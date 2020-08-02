import 'dart:convert';

import 'package:xz_furniture_app_2/models/Categories.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchCategories() async {
  const String apiUrl =
      "https://5f26b5610824d8001655ea9f.mockapi.io/furniture-categories";

  final response = await http.get(apiUrl);

  if (response.statusCode == 200) {
    List<Category> categories = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    return categories;
  } else {
    throw Exception("Failed to load categories");
  }
}
