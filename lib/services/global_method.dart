
import 'package:flutter/material.dart';

class GlobalMethods{
Future<void> showDialogg(String title, String subtitle, Function fct, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.network(
                    'https://static.wixstatic.com/media/9d8ed5_941f979ed8b849efbec34738f4d86b48~mv2.png/v1/fill/w_600,h_740,al_c/9d8ed5_941f979ed8b849efbec34738f4d86b48~mv2.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title),
                ),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    fct();
                    Navigator.pop(context);
                  },
                  child: Text('ok'))
            ],
          );
        });
  }
}