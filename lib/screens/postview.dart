import 'package:flutter/material.dart';

import '../Models/Post.dart';
import '../Widgets/Post.dart';

class PostView extends StatefulWidget {
  PostView({super.key, required this.post});
  Post? post;

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PostWidget(post: widget.post!)),
    );
  }
}
