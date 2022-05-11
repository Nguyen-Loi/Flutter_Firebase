import 'package:ECommerceApp/widget/cart_empty.dart';
import 'package:ECommerceApp/widget/cart_full.dart';
import 'package:flutter/material.dart';

class BottomCart extends StatelessWidget {
 
 List products = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: products.isEmpty? CartEmpty():CartFull(),
       body: products.isEmpty==false? CartEmpty():CartFull(),
    );
  }
}