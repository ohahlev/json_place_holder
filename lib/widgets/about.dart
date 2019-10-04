/**
 * author: ohahlev@gmail.com
 */
import 'package:flutter/material.dart';
import 'package:json_place_holder/widgets/about_list_item.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About")
      ),
      body: ListView(children: <Widget>[
        AboutListItem(
          title: "Profile",
          subtitle: "This app is all about posts"
        ),
        AboutListItem(
          title: "Develeloper",
          subtitle: "ohahlev@gmail.com"
        ),
        AboutListItem(
          title: "Version",
          subtitle: "1.0.0.0"
        ),
      ]),
    );
  }
}