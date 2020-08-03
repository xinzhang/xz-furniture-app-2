import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/components/title_text.dart';
import 'package:xz_furniture_app_2/constants.dart';
import 'package:xz_furniture_app_2/models/Categories.dart';
import 'package:xz_furniture_app_2/screens/home/components/custom_shape.dart';
import 'package:xz_furniture_app_2/size_config.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
          width: defaultSize * 20.5,
          child: AspectRatio(
            aspectRatio: 0.83,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                ClipPath(
                  clipper: CategoryCustomShape(),
                  child: AspectRatio(
                      aspectRatio: 1.025,
                      child: Container(
                          padding: EdgeInsets.all(defaultSize * 2),
                          color: kSecondaryColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TitleText(title: category.title),
                              SizedBox(height: defaultSize),
                              Text("${category.numOfProducts}+ Products",
                                  style: TextStyle(
                                    color: kTextColor.withOpacity(0.6),
                                  ))
                            ],
                          ))),
                ),
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AspectRatio(
                        aspectRatio: 1.15,
                        child: FadeInImage.assetNetwork(
                            placeholder: "assets/spinner.gif",
                            image: category.image)))
              ],
            ),
          )),
    );
  }
}
