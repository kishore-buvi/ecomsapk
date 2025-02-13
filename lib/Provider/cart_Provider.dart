import 'package:ecomsapk/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartProvider extends ChangeNotifier{

 final List<Product> _cart=[];
  List<Product> get cart=>_cart;
 void removeFromCart(Product product) {
   _cart.remove(product);
   notifyListeners();
 }
  void toogleFavourite(Product product){
    if(_cart.contains(product)){
      for(Product element in _cart){
element.quantity++;
      }
    }
    else {
      _cart.add(product);
    }
    notifyListeners();
  }
  incrementQtn(int index){
_cart[index].quantity++;
  }
 void decQtn(int index) {
   if (_cart[index].quantity > 1) {
     _cart[index].quantity--;
   } else {
     _cart.removeAt(index); // 🔥 Remove item if quantity reaches 1
   }
   notifyListeners();
 }

 totalPrice(){
    double total1=0.0;
    for(Product element in _cart){
      total1 +=element.price*element.quantity;
    }
    return total1;
 }
static CartProvider of(BuildContext context,{
  bool listen=true,
 }){
    return Provider.of<CartProvider>(context,listen: true);
 }
}
