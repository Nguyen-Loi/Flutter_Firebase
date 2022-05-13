import 'package:ECommerceApp/provider/cart_provider.dart';
import 'package:ECommerceApp/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'package:ECommerceApp/consts/colors.dart';
import 'package:ECommerceApp/inner_screens/product_details.dart';
import 'package:ECommerceApp/models/cart_attr.dart';
import 'package:ECommerceApp/provider/dark_theme_provider.dart';

class CartFull extends StatefulWidget {
  final String productId;
  const CartFull({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  GlobalMethods globalMethods = GlobalMethods();
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartProviderModel = Provider.of<CartAttr>(context);
    final cartProviderAtt = Provider.of<CartProvider>(context);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 135,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
          ),
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
          children: [
            Container(
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartProviderModel.imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            cartProviderModel.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {
                              globalMethods.showDialogg('Remove item!',
                                  'Product will be removed from the cart', () {
                                cartProviderAtt.removeItem(widget.productId);
                              }, context);
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Entypo.cross,
                                color: Colors.red,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Price:'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${cartProviderModel.price}\$',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Sub Total:'),
                        SizedBox(
                          width: 5,
                        ),
                        FittedBox(
                          child: Text(
                            '${cartProviderModel.subTotalItem.toStringAsFixed(2)}\$',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: themeChange.darkTheme
                                    ? Colors.brown.shade900
                                    : Theme.of(context).accentColor),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Ships Free',
                          style: TextStyle(
                              color: themeChange.darkTheme
                                  ? Colors.brown.shade900
                                  : Theme.of(context).accentColor),
                        ),
                        Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: cartProviderModel.quantity < 2
                                ? null
                                : () {
                                    cartProviderAtt.reduceItemByOne(
                                        widget.productId,
                                        cartProviderModel.price,
                                        cartProviderModel.title,
                                        cartProviderModel.imageUrl);
                                  },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.minus,
                                  color: cartProviderModel.quantity < 2
                                      ? Colors.grey
                                      : Colors.red,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(cartProviderModel.quantity.toString()),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(4.0),
                            // splashColor: ,
                            onTap: () {
                              cartProviderAtt.addProductToCart(
                                  widget.productId,
                                  cartProviderModel.price,
                                  cartProviderModel.title,
                                  cartProviderModel.imageUrl);
                            },
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Icon(
                                  Entypo.plus,
                                  color: Colors.green,
                                  size: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
