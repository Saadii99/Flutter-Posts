import 'dart:convert';

import 'package:flutter_posts_task/models/post_model.dart';
import 'package:flutter_posts_task/res/components/app_urls.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> fetchPosts() async {
  final response = await http.get(Uri.parse('${AppUrl.baseUrl}posts'));
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((data) => Post.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to load posts');
  }
}
