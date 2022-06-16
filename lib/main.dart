import 'package:bmi/constants/constant.dart';
import 'package:bmi/views/data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: primaryColor),
          titleTextStyle: TextStyle(color: primaryColor),
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: const Datascreen(),
    );
  }
}
