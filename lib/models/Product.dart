import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ip1.png",
      "assets/images/ip2.png",
      "assets/images/ip3.png",
      "assets/images/ip4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFFE6BFD3),
      Color(0xFF21547D),
      Colors.white,
    ],
    title: "Iphone 13",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/ip2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFFE6BFD3),
      Color(0xFF21547D),
      Colors.white,
    ],
    title: "Iphone 13",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/ip3.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFFE6BFD3),
      Color(0xFF21547D),
      Colors.white,
    ],
    title: "Iphone 13",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/ip4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFFE6BFD3),
      Color(0xFF21547D),
      Colors.white,
    ],
    title: "Iphone 13",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description = "Dung iphone ngon theo cach cua ban ^___^ …";
