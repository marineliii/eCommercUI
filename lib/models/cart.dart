
import 'package:ecommerce_ui/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier{
  // list of shoes for sale

  List <Shoe> shoeShop = [Shoe(name: "Jordan", price: "240", description: "cool shoe", imagePath: "lib/images/Jordan.png"),
    Shoe(
      name: "Air Jordan Red",
      price: "250", 
      description: "cool but red", 
      imagePath: "lib/images/JordanRed.png"),
      Shoe(name: "Kobe High", price: "300", description: "Basketball shoe", imagePath: "lib/images/Kobe.png"),
      Shoe(name: "Stabbilo", price: "120", description: "Handball shoe", imagePath: "lib/images/StabbiloShoes.png"),
      Shoe(name: "White Stabilo", price: "140", description: "Handball shoe, but white", imagePath: "lib/images/WhiteStabbilo.png"),
  ];

  // list of items in user cart

  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  // get cart 
  List<Shoe> getUserCart(){
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }

}