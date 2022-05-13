import 'package:ECommerceApp/consts/colors.dart';
import 'package:ECommerceApp/consts/my_icons.dart';
import 'package:ECommerceApp/provider/cart_provider.dart';
import 'package:ECommerceApp/services/global_method.dart';
import 'package:ECommerceApp/widget/cart_empty.dart';
import 'package:ECommerceApp/widget/cart_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomCart extends StatelessWidget {
  static const routeName = '/CartScreen';
  GlobalMethods globalMethods = GlobalMethods();
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(
                context, cartProvider.totalAmount.toStringAsFixed(2)),
            appBar: AppBar(
              title: Text('Cart (${cartProvider.getCartItems.length})'),
              backgroundColor: Theme.of(context).backgroundColor,
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear cart!', 'Your cart will be cleared!', () {
                      cartProvider.clearCart();
                    }, context);
                  },
                  icon: Icon(MyAppIcons.trash),
                )
              ],
            ),
            body: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: ListView.builder(
                  itemCount: cartProvider.getCartItems.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartItems.values.toList()[index],
                        child: CartFull(
                          productId:
                              cartProvider.getCartItems.keys.toList()[index],
                        ));
                  }),
            ),
          );
  }

  Widget checkoutSection(BuildContext ctx, String totalPrice) {
    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            /// mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: [
                      ColorsConsts.gradiendLStart,
                      ColorsConsts.gradiendLEnd,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      splashColor: Theme.of(ctx).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Checkout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(ctx).textSelectionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Total:',
                style: TextStyle(
                    color: Theme.of(ctx).textSelectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                'US \$ ${totalPrice}',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ));
  }
}
