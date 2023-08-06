import 'package:asd/widgets/products/products.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../scoped-models/connected_products.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text("choose"),
              automaticallyImplyLeading: false,
            ),
            ListTile(
              title: Text("Manage Products"),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          ScopedModelDescendant<MainModel>(builder: (
            BuildContext context,
            Widget? child,
              MainModel model,
          ) {
            return IconButton(
              onPressed: () {
                model.toggleFavoriteMode();
              },
              icon: Icon(model.displayFavoritesOnly == false
                  ? Icons.favorite_border
                  : Icons.favorite),
            );
          })
        ],
      ),
      body: Products(),
    );
  }
}
