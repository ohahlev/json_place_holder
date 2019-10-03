import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {

  final String title;
  final Icon icon;
  final GestureTapCallback onPressed;

  DrawerItem({this.title, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            icon: this.icon,
            onPressed: this.onPressed
          ),
        ),
        Text(this.title),
      ],
    );
  }
}
