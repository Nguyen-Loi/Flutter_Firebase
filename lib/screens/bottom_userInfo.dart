import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class BottomUserInfo extends StatefulWidget {
  @override
  State<BottomUserInfo> createState() => _BottomUserInfoState();
}

class _BottomUserInfoState extends State<BottomUserInfo> {
  bool _value = false;
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
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: userTitle(title: 'User setting'),
          ),
          Divider(thickness: 1, color: Colors.grey),
          ListTileSwitch(
            value: _value,
            leading: Icon(Ionicons.md_moon),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            switchActiveColor: Colors.indigo,
            title: Text('Dart theme'),
          ),
           userListTile(
              title: 'Logout', subTitle: '', icon: Icons.exit_to_app_rounded)
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
