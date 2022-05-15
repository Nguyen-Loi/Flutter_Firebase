import 'package:ECommerceApp/screens/product_details.dart';
import 'package:ECommerceApp/services/global_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ECommerceApp/consts/colors.dart';
import 'package:ECommerceApp/models/favs_attr.dart';
import 'package:ECommerceApp/provider/favs_provider.dart';

class WishlistFull extends StatefulWidget {
  final String idProduct;
  const WishlistFull({
    Key? key,
    required this.idProduct,
  }) : super(key: key);
  @override
  _WishlistFullState createState() => _WishlistFullState();
}

class _WishlistFullState extends State<WishlistFull> {
  @override
  Widget build(BuildContext context) {
    final favsModel = Provider.of<FavsAttr>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
          child: Material(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            elevation: 3.0,
            child: InkWell(
              onTap: () {

            Navigator.pushNamed(context, ProductDetails.routeName,
                    arguments: widget.idProduct);
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 80,
                      child: Image.network(favsModel.imageUrl),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            favsModel.title,
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "\$ ${favsModel.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        positionedRemove(widget.idProduct),
      ],
    );
  }

  Widget positionedRemove(String productId) {
    final favsModel = Provider.of<FavsProvider>(context);
    GlobalMethods globalMethods = GlobalMethods();
    return Positioned(
      top: 20,
      right: 15,
      child: Container(
        height: 30,
        width: 30,
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          padding: EdgeInsets.all(0.0),
          color: ColorsConsts.favColor,
          child: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            globalMethods.showDialogg('Remove wish!',
                'This product will be removed from your wishlist!', () {
              favsModel.removeItem(productId);
            }, context);
          },
        ),
      ),
    );
  }
}
