import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/components/title_text.dart';
import 'package:xz_furniture_app_2/screens/home/components/categories.dart';
import 'package:xz_furniture_app_2/services/fetchCategories.dart';
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
          child: TitleText(title: "Browse by Categories"),
        ),
        FutureBuilder(
          future: fetchCategories(),
          builder: (conntext, snapshot) => snapshot.hasData
              ? Categories(categories: snapshot.data)
              : Center(child: Image.asset("assets/ripple.gif")),
        ),
        Divider(height: 51),
      ],
    )));
  }
}
