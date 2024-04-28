import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:cheese_kosichka/generated/locale_keys.g.dart';

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
