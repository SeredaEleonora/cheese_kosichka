import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cheese_kosichka/generated/locale_keys.g.dart';

class PostCard extends StatefulWidget {
  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int likes = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(width: 10),
                Text('#Name'.tr()),
              ],
            ),
            SizedBox(height: 10),
            Text('#PostText'.tr()),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      likes++;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.thumb_up),
                      SizedBox(width: 5),
                      Text(LocaleKeys.Like.tr()),
                      Text('($likes)')
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _showCommentDialog(context);
                  },
                  child: Text(LocaleKeys.Comment.tr()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCommentDialog(BuildContext context) async {
    TextEditingController commentController = TextEditingController();
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleKeys.Comment.tr()),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: commentController,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.Comment.tr(),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(LocaleKeys.Cancel.tr()),
            ),
            TextButton(
              onPressed: () {
                String comment = commentController.text;
                print('Comment: $comment');
                Navigator.of(context).pop();
              },
              child: Text(LocaleKeys.Save.tr()),
            ),
          ],
        );
      },
    );
  }
}
