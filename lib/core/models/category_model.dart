import 'package:flutter/material.dart';

class CategoryModel {
  final String id, title, imagePath;
  final Color bgColor;

  CategoryModel(
      {required this.id,
      required this.title,
      required this.imagePath,
      required this.bgColor});
}
