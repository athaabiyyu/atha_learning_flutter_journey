import 'package:flutter/material.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  
  @override
  // ignore: library_private_types_in_public_api
  _ChecklistPageState createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {

  final List<Map<String, dynamic>> _tugasHarian = [
    {'tugas' : 'Bangun tidur', 'selesai' : false},
    {'tugas' : 'Sholat subuh', 'selesai' : false},
    {'tugas' : 'Ngoding 1 jam', 'selesai' : false},
    {'tugas' : 'Baca buku', 'selesai' : false},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checklist Tugas Harian'),
      ),
      body: ListView.builder(
        itemCount: _tugasHarian.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _tugasHarian[index]['selesai'] = !_tugasHarian[index]['selesai'];
              });
            },
            child: ListTile(
              leading: Checkbox(
                value: _tugasHarian[index]['selesai'], 
                onChanged: (value) {
                  setState(() {
                    _tugasHarian[index]['selesai'] = value!;
                  });
                }
              ),
              title: Text(
                _tugasHarian[index]['tugas'],
                style: TextStyle(
                  decoration: _tugasHarian[index]['selesai']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                ),
              ),
            ),
          );
        }
      )
    );
  }
}