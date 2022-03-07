// @dart=2.9

import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/screens/login_form.dart';
import 'package:vacinai_app_novo/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VacinAi',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Splash(),
    );
  }
}
