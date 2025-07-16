import 'package:flutter/material.dart';
import 'view/checklist/home.dart';
import 'view/increment tombol/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist Tugas Harian',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: IncrementButtonPage(),
    );
  }
}
