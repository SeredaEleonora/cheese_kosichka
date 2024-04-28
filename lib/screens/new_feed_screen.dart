import 'package:flutter/material.dart';
import 'package:cheese_kosichka/widgets/profile_card.dart';
import 'package:cheese_kosichka/widgets/post_list.dart';

class NewsFeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileCard(),
            SizedBox(height: 20),
            PostList(),
          ],
        ),
      ),
    );
  }
}
