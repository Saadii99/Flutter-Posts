import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_posts_task/models/post_model.dart';
import 'package:flutter_posts_task/res/methods/fetch_posts.dart';
import 'package:flutter_posts_task/screens/Post_Detail_Screen.dart';
import 'package:flutter_posts_task/utils/utils.dart';
import 'package:flutter_posts_task/widgets/loading_widget.dart';
import 'package:flutter_posts_task/widgets/post_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchPostsData();
  }

  Future<void> fetchPostsData() async {
    try {
      List<Post> fetchedPosts = await fetchPosts();
      setState(() {
        posts = fetchedPosts;
        isLoading = false;
      });
    } catch (e) {
      Utils.snackBar(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Posts')),
      body: isLoading
          ? const LoadingWidget() //loading widget
          : ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return PostCard(
                  post: posts[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PostDetailScreen(post: posts[index])),
                    );
                  },
                );
              },
            ),
    );
  }
}
