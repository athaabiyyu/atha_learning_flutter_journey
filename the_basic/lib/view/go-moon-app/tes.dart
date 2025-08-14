import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {

  late double _deviceWidth;
  late double _deviceHeight;

  // Daftar Pilihan stasiun
  final List<String> _stationsList = [
    'Apollo 11',
    'Apollo 12',
    'Apollo 14',
    'Apollo 15',
    'Apollo 16',
    'Apollo 17',
  ];

  // Variable untuk menyimpan pilihan stasiun yang dipilih
  String? _selectedStation;

  @override
  Widget build(BuildContext context) {
    // Inisialisasi ukuran perangkat
    _deviceHeight = MediaQuery.of(context).size.height; 
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.02, 
          vertical: _deviceHeight * 0.02,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              _backgroundImageWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitleWidget(),
                  _stationsDropdownWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pageTitleWidget() {
    return Container(
      color: Colors.red,
      child: Text(
        "Go Moon App",
        style: TextStyle(
          fontSize: _deviceWidth * 0.13,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _backgroundImageWidget() {
    return Container(
      width: _deviceWidth, // mengisi widget dengan lebar layar
      height: _deviceHeight, // mengisi widget dengan tinggi layar
      decoration: const BoxDecoration(
          // menambahkan dekorasi pada container untuk membuat background
          image: DecorationImage(
        // menambahkan gambar sebagai background
        image: AssetImage('assets/images/moon.png'),
        fit: BoxFit
            .contain, // mengatur gambar agar sesuai dengan ukuran container
      )),
    );
  }

  Widget _stationsDropdownWidget() {
    return Container(
      color: Colors.yellow,
      child: DropdownButton(
        value: _selectedStation,
        items: _stationsList.map((station) {
          return DropdownMenuItem(
            value: station,
            child: Text(station),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedStation = value; // update pilihan
          });
        },
        dropdownColor: Colors.black87, // warna background dropdown
        style: const TextStyle(color: Colors.white), // warna teks
        iconEnabledColor: Colors.white, // warna icon arrow
      ),
    );
  }
}