import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_basic/view/go-moon-app/home.dart';
import 'package:the_basic/view/go-moon-app/tes.dart';
import 'package:the_basic/view/taskly-app/home.dart';
import 'package:the_basic/view/koperasi-rsb/login-screen.dart';
import 'package:the_basic/widget-globals/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('hive_boxes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taskly',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: false,
      ),
      home: TasklyHome(), 
    );
  }
}