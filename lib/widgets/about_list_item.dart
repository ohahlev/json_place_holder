import 'package:flutter/material.dart';

class AboutListItem extends StatelessWidget {

  final String title;
  final String subtitle;

  AboutListItem({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(this.title,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(this.subtitle),
          )
        ],
      ),
    );
  }
}
