// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce_ui/components/shoe_tile.dart';
import 'package:ecommerce_ui/models/cart.dart';
import 'package:ecommerce_ui/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

//add shoe to cart function
void addShoeToCart(Shoe shoe){
  Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

  //
  showDialog(context: context, builder: (context)=> AlertDialog(
    title: Text("Successfully added!"),
    content: Text("Check your cart"),
  ),);

}

  @override
  Widget build(BuildContext context) {
    return  Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
        //search bar
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: Colors.grey.shade200, 
          borderRadius: BorderRadius.circular(20),
          
          ),
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              
              Text("Search",style: TextStyle(color: Colors.grey.shade900),),
              Icon(Icons.search, color: Colors.grey.shade900,),
      
            ],
          ),
        ),
      
        //message
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("everyone flies.. some fly longer than others",style: TextStyle(color: Colors.grey.shade900),),
        ),
      
        //hot picks
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Hot Picks 🥵🔥", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
            Text("See all", style: TextStyle(
              color: Colors.pink,
        
            ),
            )
          ],
        ),
      ),
      const SizedBox(height: 10),
      Expanded(child: ListView.builder(
        itemCount: value.getShoeList().length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Shoe shoe = value.getShoeList()[index];

          return ShoeTile(shoe: shoe,
          onTap: () => addShoeToCart(shoe));
        } ,
      ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 25,right: 25,left: 25),
        child: Divider(
          color: Colors.white,
        ),
      )
      
         
      
         ],
       ),
    );
  }
}