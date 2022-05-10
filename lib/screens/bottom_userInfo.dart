import 'package:flutter/material.dart';

class BottomUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          userListTile(title: 'Email', subTitle: 'nguyenloi@gmail.com', icon: Icons.email),
          userListTile(title: 'Phone number', subTitle: '0898 066 957', icon: Icons.phone),
          userListTile(title: 'Shipping address', subTitle: '1419 Hung vuong', icon: Icons.local_shipping),
          userListTile(title: 'Joined date', subTitle: 'Date', icon: Icons.watch_later),

        ],
      ),
    );
  }
}

class userListTile extends StatelessWidget {
  final String title, subTitle;
  final IconData icon;
   userListTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
            title: Text(title),
            subtitle: Text(subTitle),
            leading: Icon(icon)),
      ),
    );
  }
}
