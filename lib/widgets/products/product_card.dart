import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../models/product.dart';
import '../../scoped-models/main.dart';
import '../../scoped-models/products.dart';
import '../title_default.dart';
import './price_tag.dart';
import './address_tag.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitlePriceRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product.price.toString())
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
        ScopedModelDescendant<MainModel>(builder: (
          BuildContext context,
          Widget? child,
            MainModel model,
        ) {
          return IconButton(
              icon: Icon(
             //   model.getFavoriteStatus(productIndex)
              model.products[productIndex].isFavorite ? Icons.favorite:
                  Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                model.setSelectedIndex(productIndex);
                model.toggleProductFavoriteStatus();
              });
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitlePriceRow(),
          AddressTag('Union Square, San Francisco'),
          Text(product.userEmail),
          _buildActionButtons(context)
        ],
      ),
    );
    ;
  }
}
