import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/homePage.dart';
import 'pages/loginPage.dart';

class LogiApp extends StatelessWidget {
  // This widget is the root of your application.
  final storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Logi',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        backgroundColor: Colors.black,
        primarySwatch: Colors.indigo,
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
      ),
      home: storage.read('token') != null ? HomePage() : LoginPage(),
    );
  }
}
