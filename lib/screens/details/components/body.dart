import 'package:flutter/material.dart';
import 'package:xz_furniture_app_2/models/Product.dart';
import 'package:xz_furniture_app_2/screens/details/components/product_descriptionn.dart';
import 'package:xz_furniture_app_2/screens/details/components/product_info.dart';
import 'package:xz_furniture_app_2/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProductInfo(product: product),
          ProductDescription(product: product)
        ],
      ),
    );
  }
}
