import 'package:flutter/material.dart';

class BottomUserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: userTitle(title: 'User information'),
          ),
          Divider(thickness: 1, color: Colors.grey),
          userListTile(
              title: 'Email',
              subTitle: 'nguyenloi@gmail.com',
              icon: Icons.email),
          userListTile(
              title: 'Phone number',
              subTitle: '0898 066 957',
              icon: Icons.phone),
          userListTile(
              title: 'Shipping address',
              subTitle: '1419 Hung vuong',
              icon: Icons.local_shipping),
          userListTile(
              title: 'Joined date', subTitle: 'Date', icon: Icons.watch_later),
        ],
      ),
    );
  }
}

class userTitle extends StatelessWidget {
  final String title;
  const userTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
            title: Text(title), subtitle: Text(subTitle), leading: Icon(icon)),
      ),
    );
  }
}
