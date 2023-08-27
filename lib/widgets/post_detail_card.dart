import 'package:flutter/material.dart';
import 'package:flutter_posts_task/models/post_model.dart';

class PostDetailCard extends StatelessWidget {
  final Post post;

  PostDetailCard({required this.post});

  @override
  Widget build(BuildContext context) {

    //post container
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //post title
          Text(
            post.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),

          //post body
          Text(
            post.body,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
