import 'package:ECommerceApp/consts/theme_data.dart';
import 'package:ECommerceApp/inner_screens/brands_navigation_rail.dart';
import 'package:ECommerceApp/inner_screens/categories_feeds.dart';
import 'package:ECommerceApp/screens/auth/login.dart';
import 'package:ECommerceApp/screens/auth/sign_up.dart';
import 'package:ECommerceApp/screens/landing_page.dart';
import 'package:ECommerceApp/screens/product_details.dart';
import 'package:ECommerceApp/models/cart_attr.dart';
import 'package:ECommerceApp/provider/cart_provider.dart';
import 'package:ECommerceApp/provider/dark_theme_provider.dart';
import 'package:ECommerceApp/provider/favs_provider.dart';
import 'package:ECommerceApp/provider/products_provider.dart';
import 'package:ECommerceApp/screens/bottom_cart.dart';
import 'package:ECommerceApp/screens/bottom_feeds.dart';
import 'package:ECommerceApp/screens/bottom_view.dart';
import 'package:ECommerceApp/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => themeChangeProvider),
             ChangeNotifierProvider(create: (_) => ProductProvider()),
             ChangeNotifierProvider(create: (_) => CartProvider()),
             ChangeNotifierProvider(create: (_) => FavsProvider()),
          ],
          child:
              Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: Styles.themeData(themeChangeProvider.darkTheme, context),
              home: LandingPage(),
              routes: {
              BrandNavigationRailScreen.routeName: (ctx) =>
                  BrandNavigationRailScreen(),
              BottomCart.routeName: (ctx) => BottomCart(),
              BottomFeeds.routeName: (ctx) => BottomFeeds(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
                ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
                            LoginScreen.routeName: (ctx) => LoginScreen(),
              SignUpScreen.routeName: (ctx) => SignUpScreen(),
            },
            );
          }));
    });
  }
}
