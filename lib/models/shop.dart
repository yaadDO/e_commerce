import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Item description..",
      imagePath: '',
    ),

    Product(
      name: "Product 2",
      price: 99.99,
      description: "Item description..",
      imagePath: '',
    ),

    Product(
      name: "Product 3",
      price: 99.99,
      description: "Item description..",
      imagePath: '',
    ),

    Product(
      name: "Product 4",
      price: 99.99,
      description: "Item description..",
      imagePath: '',
    ),
  ];

  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
