import 'package:ECommerceApp/consts/my_icons.dart';
import 'package:ECommerceApp/screens/bottom_search.dart';
import 'package:ECommerceApp/screens/bottom_userInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'bottom_cart.dart';
import 'bottom_feeds.dart';
import 'bottom_home.dart';

class BottomViewScreen extends StatefulWidget {
  @override
  _BottomViewScreenState createState() => _BottomViewScreenState();
}

class _BottomViewScreenState extends State<BottomViewScreen> {
  int currentIndex = 0;
  List<Widget> body = [
    BottomHome(),
    BottomFeeds(),
    BottomSearch(),
    BottomCart(),
    BottomUserInfo(),
  ];

  void onTapBottomView(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: onTapBottomView,
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).textSelectionColor,
              selectedItemColor: Colors.purple,
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.rss),
                  label: 'Feeds',
                ),
                const BottomNavigationBarItem(
                  activeIcon: null,
                  icon: Icon(null),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    MyAppIcons.bag,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(MyAppIcons.user),
                  label: 'User',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Search',
          elevation: 4,
          child: Icon(MyAppIcons.search),
          onPressed: () => setState(() {
            currentIndex = 2;
          }),
        ),
      ),
    );
  }
}
