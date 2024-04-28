import 'package:auto_route/auto_route.dart';
import 'package:cheese_kosichka/screens/new_feed_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:cheese_kosichka/generated/locale_keys.g.dart';
import 'screens/news_feed_screen.dart';
import 'screens/settings_screen.dart';
import 'widgets/post_card.dart';
import 'widgets/post_list.dart';
import 'widgets/profile_card.dart';
import 'routes/router.gr.dart';

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AutoRouterDelegate(
        AutoRouterConfig(
          routes: [
            SettingsRoute(),
            NewsFeedRoute(),
          ],
        ),
      ),
      routeInformationParser: AutoRouterInformationParser(),
      builder: (context, router) => router!,
    );
  }
}



