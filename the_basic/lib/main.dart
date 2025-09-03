import 'package:flutter/material.dart';
import 'package:the_basic/view/go-moon-app/home.dart';
import 'package:the_basic/view/go-moon-app/tes.dart';
import 'package:the_basic/view/koperasi-rsb/login-screen.dart';
import 'package:the_basic/widget-globals/colors.dart';

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
        scaffoldBackgroundColor: black,
        useMaterial3: true,
      ),
      home: GoMoonHome(), 
    );
  }
}