import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_lesson/model/post.dart';
import 'package:hive_lesson/screen/post_list_screen.dart';

class PostAddScreen extends StatefulWidget {
  const PostAddScreen({super.key});

  @override
  State<PostAddScreen> createState() => _PostAddScreenState();
}

class _PostAddScreenState extends State<PostAddScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

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
        title: const Text('Create Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _authorController,
                decoration: const InputDecoration(labelText: 'Author'),
              ),
              TextField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: 'Content'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(100, 40),
                ),
                onPressed: () {
                  final value = Post(
                    title: _titleController.text,
                    author: _authorController.text,
                    content: _contentController.text,
                  );

                  Hive.box('posts').add(value);
                  print('Submit');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostListScreen(),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
