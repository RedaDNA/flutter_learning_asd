/*import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
*//*
mixin hgjghf on Model {
  List<Product> _products = [];
   int? selectedIndex;
   late bool favoriteMode=false;

  List<Product> get products {
    //to copy the items in _products and return them as another list
    if(!favoriteMode)
    return List.from(_products);
    else return _products.where((Product product) => product.isFavorite==true).toList();
  }
  void toggleFavoriteMode(){
     favoriteMode= !favoriteMode;
notifyListeners();
  }

  void addProduct(Product product) {
    _products.add(product);
    selectedIndex=null;
  }

  void editProduct( Product product) {
    _products[selectedIndex!] = product;
    selectedIndex=null;

  }

  void deleteProduct() {
    _products.removeAt(selectedIndex!);
    selectedIndex=null;
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
  void setSelectedIndexToNull(){
    selectedIndex=null;
  }

  void toggleProductFavoriteStatus() {
    Product selectedProduct= getSelectedProduct()!;
    final bool isCurrentlyFavorite = selectedProduct.isFavorite!;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updatedProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        isFavorite: newFavoriteStatus);
    _products[selectedIndex!] = updatedProduct;
    setSelectedIndexToNull();
    notifyListeners();
  }

  Product? getSelectedProduct(){
    if(selectedIndex != null) return _products[selectedIndex!];
    else return null;

  }
  bool getFavoriteStatus(int index){

    if(_products[index].isFavorite != null)
    return _products[index].isFavorite!;
    else throw Exception("nuLLLLLL");
    notifyListeners();
  }
}
*/