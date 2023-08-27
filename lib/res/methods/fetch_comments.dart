import 'dart:convert';
import 'package:flutter_posts_task/res/components/app_urls.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_posts_task/models/comment_model.dart';

Future<List<Comment>> fetchCommentsForPost(int postId) async {
  final response =
      await http.get(Uri.parse('${AppUrl.baseUrl}posts/$postId/comments'));
  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    if (data.isNotEmpty) {
      final comments =
          data.take(5).map((data) => Comment.fromJson(data)).toList();
      return comments;
    }
  } else {
    throw Exception('Failed to load comments');
  }
  return [];
}
