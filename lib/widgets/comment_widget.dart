import 'package:flutter/material.dart';
import 'package:flutter_posts_task/models/comment_model.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  CommentWidget({required this.comment});

  @override
  Widget build(BuildContext context) {

    //comment container
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //commenter name
          Text(
            comment.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),

          //commenter email
          Text(
            comment.email,
            style: TextStyle(color: Colors.grey[500]),
          ),
          SizedBox(height: 8),

          //body of the comment
          Text(
            comment.body.isNotEmpty ? comment.body : "blank comment",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
