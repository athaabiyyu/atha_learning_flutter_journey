import 'package:flutter/material.dart';

// Widget IcremerntButtonPage
class IncrementButtonPage extends StatefulWidget {
  const IncrementButtonPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IncrementButtonPageState createState() => _IncrementButtonPageState(); // ini statenya
}

// Ini Class State untuk IncrementButtonPage
// State ini akan mengelola state dari IncrementButtonPage
class _IncrementButtonPageState extends State<IncrementButtonPage> {

  // state untuk menyimpan nilai
  int _counter = 0;
  
  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // build UI nya
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Increment Button Page'),
      ),
      body: Center(
        child: Text(
          'Jumlah klik: $_counter',
          style: const TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter, // panggil fungsi incrementCounter saat tombol ditekan
         child: const Icon(Icons.add),
      ),
    );
  }
}
