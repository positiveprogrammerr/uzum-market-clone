import 'package:flutter/material.dart';

import 'rating_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductModel {
    ProductModel({
        required this.id,
        required this.title,
        required this.price,
        required this.description,
        required this.category,
        required this.image,
        required this.rating,
        this.isFavourite = false,
    });

    final int? id;
    final String? title;
    final double? price;
    final String? description;
    final String? category;
    final String? image;
    final Rating? rating;
    bool isFavourite;

   factory ProductModel.fromJson(Map<String, dynamic> json) {
  return ProductModel(
    id: json["id"],
    title: json["title"],
    price: (json["price"] as num).toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );
}


 void toggleLike(){
  isFavourite = !isFavourite;
}




}


