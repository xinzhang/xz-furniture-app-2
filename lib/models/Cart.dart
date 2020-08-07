import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/models/Product.dart';

class CartModel extends ChangeNotifier {
  /// List of items in the cart.
  List<Product> _products = [];

  List<Product> get items => _products.toList();

  int get totalPrice =>
      _products.fold(0, (total, current) => total + current.price);

  void add(Product item) {
    _products.add(item);
    notifyListeners();
  }
}
