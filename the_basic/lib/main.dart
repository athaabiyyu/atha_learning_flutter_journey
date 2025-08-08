import 'package:flutter/material.dart';
import 'package:the_basic/view/go-moon-app/home.dart';
import 'package:the_basic/view/go-moon-app/tes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: GoMoonHome(),
    );
  }
}