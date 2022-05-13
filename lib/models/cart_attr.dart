import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  final String id;
  final String title;
 late final int quantity;
 late final double price;
final String imageUrl;
int get getQuantity => quantity;


double get getPrice => price;



  
  CartAttr({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  double get subTotalItem { 
   return getPrice*getQuantity;
   }

 
}
