import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/components/title_text.dart';
import 'package:xz_furniture_app_2/constants.dart';
import 'package:xz_furniture_app_2/models/Categories.dart';
import 'package:xz_furniture_app_2/size_config.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
        child: Column(
      children: <Widget>[
        TitleText(title: category.title),
        SizedBox(height: defaultSize),
        Text("${category.numOfProducts}+ Products",
            style: TextStyle(
              color: kTextColor.withOpacity(0.6),
            ))
      ],
    ));
  }
}
