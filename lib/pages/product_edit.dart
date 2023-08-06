import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import '../scoped-models/main.dart';
import '../scoped-models/connected_products.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/food.jpg',
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField(Product? product) {
    return TextFormField(
      initialValue: product == null ? '' : product.title,
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (value!.isEmpty || value == null) return 'This field is required';
      },
      decoration: InputDecoration(labelText: 'Product Title'),
      onSaved: (value) {
        _formData['title'] = value!;
      },
    );
  }

  Widget _buildDescriptionTextField(Product? product) {
    return TextFormField(
      initialValue: product == null ? '' : product.description,
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Description'),
      onSaved: (value) {
        _formData['description'] = value!;
      },
    );
  }

  Widget _buildPriceTextField(Product? product) {
    return TextFormField(
        initialValue: product == null ? '' : product.price.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Product Price'),
        onSaved: (value) {
          _formData['price'] = double.parse(value!);
        });
  }

  void _submitForm(Function addProduct, Function updateProduct,
      int? selectedProductIndex) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    if (selectedProductIndex == null) {
      addProduct(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['price'],
      );
    } else {
      updateProduct(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['price'],
      );
    }
    Navigator
        .pushReplacementNamed(context, '/products');
  }


  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget? child, MainModel model) {
          return ElevatedButton(
              child: Text('Save'),
              onPressed: () =>
                  _submitForm(
                      model.addProduct, model.updateProduct,
                      model.selectedProductIndex,
             ));
        });
  }




Widget PageContent(BuildContext context, Product? product) {
  final double deviceWidth = MediaQuery
      .of(context)
      .size
      .width;
  final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth *
      0.95;
  final double targetPadding = deviceWidth - targetWidth;
  return GestureDetector(
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(product),
            _buildDescriptionTextField(product),
            _buildPriceTextField(product),
            SizedBox(
              height: 10.0,
            ),
            _buildSubmitButton(),
          ],
        ),
      ),
    ),
  );
}

@override
Widget build(BuildContext context) {
  return ScopedModelDescendant<MainModel>(builder: (BuildContext context,
      Widget? child,
      MainModel model,) {
    final Widget pageContentWidget = PageContent(
        context, model.selectedProduct);

    return model.selectedProductIndex == null
        ? pageContentWidget
        : Scaffold(
      appBar: AppBar(
        title: Text("Edit product"),
      ),
      body: pageContentWidget,
    );
  });
}


}



