import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_lesson/model/post.dart';

class PostEditScreen extends StatefulWidget {
  const PostEditScreen(
      {super.key,
      required this.title,
      required this.author,
      required this.content,
      required this.index});

  final String title;
  final String author;
  final String content;
  final int index;
  @override
  State<PostEditScreen> createState() => _PostEditScreenState();
}

class _PostEditScreenState extends State<PostEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.title;
    _authorController.text = widget.author.toString();
    _contentController.text = widget.content.toString();
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
        title: const Text('Update Data'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: widget.title,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Author',
                  hintText: widget.author,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Content',
                  hintText: widget.content,
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  final value = Post(
                    title: _titleController.text,
                    author: _authorController.text,
                    content: _contentController.text,
                  );

                  Hive.box('posts').putAt(widget.index, value);
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
