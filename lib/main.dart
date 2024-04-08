import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cheese_kosichka/generated/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU')],
    path: 'assets/translations',
    fallbackLocale: Locale('en', 'US'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.networkName.tr()),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              setState(() {
                context.locale == Locale('en', 'US')
                    ? context.setLocale(Locale('ru', 'RU'))
                    : context.setLocale(Locale('en', 'US'));
              });
            },
          ),
        ],
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

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            SizedBox(height: 10),
            Text('#Name'.tr(), style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('#Bio'.tr()),
          ],
        ),
      ),
    );
  }
}

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
