import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xz_furniture_app_2/constants.dart';
import 'package:xz_furniture_app_2/models/Cart.dart';
import 'package:xz_furniture_app_2/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: kTextColor.withOpacity(0.6),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: _CartList(),
            ),
          ),
          Divider(height: 4, color: Colors.black),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    var cart = Provider.of<CartModel>(context);

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image.network(cart.items[index].image,
            fit: BoxFit.cover,
            height: defaultSize * 5, //378
            width: defaultSize * 5),
        title: Text(
          cart.items[index].title,
          style: itemNameStyle,
        ),
        trailing: Text(
          "\$${cart.items[index].price}",
          style: TextStyle(fontSize: defaultSize * 1.3, height: 1.6),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Total: ",
                  style: TextStyle(color: kTextColor, fontSize: 20)),
              SizedBox(width: 10),
              Consumer<CartModel>(
                  builder: (context, cart, child) => Text(
                      '\$${cart.totalPrice}',
                      style: TextStyle(
                          color: kTextColor.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w600))),
              SizedBox(width: 24),
              FlatButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Buying not supported yet.')));
                },
                color: Colors.white,
                child: Text('BUY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
