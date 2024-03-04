import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';

import '../../../core/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int currentIndex;

  const CategoryItem(
      {super.key, required this.categoryModel, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.bgColor,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25),
            topLeft: const Radius.circular(25),
            bottomRight: currentIndex % 2 == 0
                ? const Radius.circular(25)
                : const Radius.circular(0),
            bottomLeft: currentIndex % 2 == 0
                ? const Radius.circular(0)
                : const Radius.circular(25),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.imagePath,
              height: 110,
            ),
            Text(
              categoryModel.title,
              style: Constants.theme.textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
