import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/models/Categories.dart';
import 'package:xz_furniture_app_2/screens/home/components/category_card.dart';

class Categories extends StatelessWidget {
  final List<Category> categories;

  const Categories({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(
        categories.length,
        (index) => CategoryCard(
          category: categories[index],
        ),
      )),
    );
  }
}
