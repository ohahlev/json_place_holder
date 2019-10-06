/**
 * author: ohahlev@gmail.com 
 */
import 'package:flutter/material.dart';
import 'package:json_place_holder/models/post.dart';

class PostCard extends StatelessWidget {

  final Post post;

  PostCard({this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            child: Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(this.post.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                maxLines: 1),
            Text(this.post.body, maxLines: 2)
          ]),
    )));
  }
}
