import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cheese_kosichka/generated/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
