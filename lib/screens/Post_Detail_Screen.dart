import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_posts_task/models/comment_model.dart';
import 'package:flutter_posts_task/models/post_model.dart';
import 'package:flutter_posts_task/res/components/app_urls.dart';
import 'package:flutter_posts_task/res/methods/fetch_comments.dart';
import 'package:flutter_posts_task/utils/utils.dart';
import 'package:flutter_posts_task/widgets/comment_widget.dart';
import 'package:flutter_posts_task/widgets/loading_widget.dart';
import 'package:flutter_posts_task/widgets/post_detail_card.dart';
import 'package:http/http.dart' as http;

class PostDetailScreen extends StatefulWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late Post post;
  List<Comment> comments = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    post = widget.post;
    fetchComments();
  }

  Future<void> fetchComments() async {
    try {
      List<Comment> fetchedComments = await fetchCommentsForPost(post.id);
      setState(() {
        comments = fetchedComments;
        isLoading = false;
      });
    } catch (e) {
      Utils.snackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Detail')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Post details
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PostDetailCard(post: post),
          ),
          const Divider(),

          //Comments static heading/title
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),

          //Comments section
          Expanded(
            child: isLoading
                ? const LoadingWidget()
                : ListView.builder(
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return comments.isNotEmpty
                          ? CommentWidget(comment: comments[index])
                          : const Text(
                              "This post has no comments",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
