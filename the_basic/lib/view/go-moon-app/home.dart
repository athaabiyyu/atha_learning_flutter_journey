import 'package:flutter/material.dart';

class GoMoonHome extends StatefulWidget {
  @override
  State<GoMoonHome> createState() => _GoMoonHomeState();
}

class _GoMoonHomeState extends State<GoMoonHome> {
  // Variable untuk menyimpan ukuran perangkat
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {

    // Inisialisasi ukuran perangkat
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea (                   // Menggunakan SafeArea agar widget tidak tertutup oleh status bar atau notifikasi
        child: Stack(                    // Simpan widget dalam Stack untuk menumpuk widget
          children: [
            _backgroundImageWidget(),    // Background image widget
            _pageTitleWidget(),          // Page title widget  
          ],
        ),
      ),
    );
  }

  Widget _backgroundImageWidget() {
    return Container(
        width: _deviceWidth,             // mengisi widget dengan lebar layar
        height: _deviceHeight,            // mengisi widget dengan tinggi layar
        decoration: const BoxDecoration(  // menambahkan dekorasi pada container untuk membuat background
          image: DecorationImage(         // menambahkan gambar sebagai background
            image: AssetImage('assets/images/moon.png'),
            fit: BoxFit.contain,          // mengatur gambar agar sesuai dengan ukuran container
          )
        ),
    );
  }

  Widget _pageTitleWidget() {
    return Text(
      "Go Moon",
      style: TextStyle(
        fontSize: _deviceWidth * 0.15,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}