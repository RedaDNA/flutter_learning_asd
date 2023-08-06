import 'package:asd/pages/product_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


import '../scoped-models/main.dart';
import '../scoped-models/connected_products.dart';

class ProductList extends StatelessWidget {


  Widget _buildAddedButton(BuildContext context, int index,MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              model.setSelectedIndex(index);
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }

  @override
   Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(builder: (
    BuildContext context,
    Widget? child,
        MainModel model,
    ) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(model.products[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart){
              model.setSelectedIndex(index);
              model.deleteProduct();
            }

          },
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(model.products[index].title),
                subtitle: Text('\$${model.products![index].price.toString()}'),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(model.products[index].image),
                ),
                trailing: _buildAddedButton(context, index,model),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: model.products.length,
    );
  });}
}
