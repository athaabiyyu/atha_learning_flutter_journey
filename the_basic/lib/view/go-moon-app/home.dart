import 'package:flutter/material.dart';

class GoMoonHome extends StatefulWidget {
  @override
  State<GoMoonHome> createState() => _GoMoonHomeState();
}

class _GoMoonHomeState extends State<GoMoonHome> {
  // Variable untuk menyimpan ukuran perangkat
  late double _deviceHeight;
  late double _deviceWidth;

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
      body: SafeArea(
        // Menggunakan SafeArea agar widget tidak tertutup oleh status bar atau notifikasi
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: _deviceWidth * 0.05, vertical: _deviceHeight * 0.05),
          child: Stack(
            // Simpan widget dalam Stack untuk menumpuk widget
            children: [
              _backgroundImageWidget(), // Background image widget
              Column(
                // Menggunakan Column untuk menata widget secara vertikal
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pageTitleWidget(), // Judul halaman
                  _stationsDropdownWidget(), // Dropdown untuk memilih stasiun
                ],
              )
            ],
          ),
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

  Widget _pageTitleWidget() {
    return Container(
      child: Text(
        "Go Moon",
        style: TextStyle(
          fontSize: _deviceWidth * 0.15,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }

  Widget _stationsDropdownWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        value: _selectedStation,
        underline: Container(),
        dropdownColor: Colors.red, // warna menu dropdown
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
        style: const TextStyle(color: Colors.white), // warna teks
        iconEnabledColor: Colors.white, // warna icon arrow
      ),
    );
  }
}
