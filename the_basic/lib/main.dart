import 'package:flutter/material.dart';
// import 'package:the_basic/view/taskly-app/home.dart';
import 'package:the_basic/view/go-moon-app/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Moon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const GoMoon(),
    );
  }
}