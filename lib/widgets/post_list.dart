import 'package:flutter/material.dart';
import 'package:cheese_kosichka/widgets/post_card.dart';

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostCard(),
        SizedBox(height: 20),
        PostCard(),
      ],
    );
  }
}
