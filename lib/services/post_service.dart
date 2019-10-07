import 'dart:convert';
import 'package:json_place_holder/models/post.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const String POST_LIST_API =
      "https://jsonplaceholder.typicode.com/posts";

  static Future<Post> fetchPost() async {
    final response = await http.get(POST_LIST_API);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<Post>> fetchPosts() async {
    final response = await http.get(POST_LIST_API);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      Iterable it = json.decode(response.body);
      return it.map((json) => Post.fromJson(json)).toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
