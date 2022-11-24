import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_lesson/model/constant.dart' as constant;

import '../model/post.dart';

class PostEditScreen extends StatefulWidget {
  const PostEditScreen({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.post.title;
    _authorController.text = widget.post.author;
    _contentController.text = widget.post.content;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.post.title}'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: widget.post.title,
                ),
              ),
              TextFormField(
                enabled: false,
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Author',
                  hintText: widget.post.author,
                ),
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  hintText: widget.post.content,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 40),
                ),
                onPressed: () async {
                  final value = Post(
                    widget.post.title,
                    widget.post.author,
                    widget.post.content,
                  );
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
