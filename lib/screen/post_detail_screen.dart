import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_lesson/screen/post_add_screen.dart';
import 'package:hive_lesson/screen/post_edit_screen.dart';

import '../model/post.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.content,
    required this.index,
  });

  final String title;
  final String author;
  final String content;
  final int index;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostEditScreen(
                    title: widget.title,
                    author: widget.author,
                    content: widget.content,
                    index: widget.index,
                  ),
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.author,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Text(widget.content),
          ],
        ),
      ),
    );
  }
}
