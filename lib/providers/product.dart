import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavoire = false,
  });
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavoire;

  void toggleFavoriteStatus() {
    isFavoire = !isFavoire;
    notifyListeners();
  }
}
