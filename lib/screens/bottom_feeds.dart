import 'package:ECommerceApp/consts/colors.dart';
import 'package:ECommerceApp/consts/my_icons.dart';
import 'package:ECommerceApp/models/product.dart';
import 'package:ECommerceApp/provider/cart_provider.dart';
import 'package:ECommerceApp/provider/products_provider.dart';
import 'package:ECommerceApp/screens/bottom_cart.dart';
import 'package:ECommerceApp/screens/wishlist.dart';
import 'package:ECommerceApp/widget/feeds_products.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favs_provider.dart';

class BottomFeeds extends StatelessWidget {
  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);
    List<Product> productsList= productsProvider.getProducts ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Feeds'),
        backgroundColor: Theme.of(context).cardColor,
        actions: [
          Consumer<FavsProvider>(
            
              builder: (_,favs, ch) {
                return Badge(
                  badgeColor: ColorsConsts.cartBadgeColor,
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition.topEnd(top: 5, end: 7),
                  badgeContent: Text(favs.getFavsItems.length.toString()),
                  child: IconButton(
                    icon: Icon(
                      MyAppIcons.wishlist,
                      color: ColorsConsts.favColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(WishlistScreen.routeName);
                    },
                  ),
                );
              }
            ),
            Consumer<CartProvider>(
            
              builder: (_,cart, ch) {
                return Badge(
                  badgeColor: ColorsConsts.cartBadgeColor,
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition.topEnd(top: 5, end: 7),
                  badgeContent: Text(cart.getCartItems.length.toString()),
                  child: IconButton(
              icon: Icon(
                MyAppIcons.cart,
                color: ColorsConsts.cartColor,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(BottomCart.routeName);
              },
            ),
                );
              }
            )
        ],
      ),
        body: GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 240 / 420,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(productsList.length, (index) {
        return ChangeNotifierProvider.value(
          value: productsList[index],
          child: FeedProducts(
          ),
        );
      }),
    ),
//         StaggeredGridView.countBuilder(
//           padding: ,
//   crossAxisCount: 6,
//   itemCount: 8,
//   itemBuilder: (BuildContext context, int index) =>FeedProducts(),
//   staggeredTileBuilder: (int index) =>
//       new StaggeredTile.count(3, index.isEven ? 4 : 5),
//   mainAxisSpacing: 8.0,
//   crossAxisSpacing: 6.0,
// ),
        );
  }
}