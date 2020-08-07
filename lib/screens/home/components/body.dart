import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/components/title_text.dart';
import 'package:xz_furniture_app_2/constants.dart';
import 'package:xz_furniture_app_2/models/Product.dart';
import 'package:xz_furniture_app_2/screens/home/components/categories.dart';
import 'package:xz_furniture_app_2/screens/home/components/product_card.dart';
import 'package:xz_furniture_app_2/screens/home/components/recommend_products.dart';
import 'package:xz_furniture_app_2/services/fetchCategories.dart';
import 'package:xz_furniture_app_2/services/fetchProducts.dart';
import 'package:xz_furniture_app_2/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
        child: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(defaultSize * 2),
          child: Row(children: <Widget>[
            Expanded(child: TitleText(title: "Browse by Categories")),
            TitleText(title: "View All"),
          ]),
        ),
        FutureBuilder(
          future: fetchCategories(),
          builder: (conntext, snapshot) => snapshot.hasData
              ? Categories(categories: snapshot.data)
              : Center(child: Image.asset("assets/ripple.gif")),
        ),
        Divider(height: 5),
        Padding(
          padding: EdgeInsets.all(defaultSize * 2),
          child: TitleText(title: "Recommends For You"),
        ),
        FutureBuilder(
          future: fetchProducts(),
          builder: (conntext, snapshot) => snapshot.hasData
              ? RecommendProducts(products: snapshot.data)
              : Center(child: Image.asset("assets/ripple.gif")),
        ),
      ],
    )));
  }
}
