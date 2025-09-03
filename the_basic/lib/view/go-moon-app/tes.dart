import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
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
  // Nilai yang dipilih (default: null)
  String? _selectedStation;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _astralImageWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _pageTitleWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _deviceWidth * 0.05,
                    vertical: _deviceHeight * 0.05,
                  ),
                  child: _stationsDropdownWidget(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _astralImageWidget() {
    return Container(
      width: _deviceWidth,
      height: _deviceHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/moon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _pageTitleWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth * 0.05,
      ),
      child: const Text(
        'Go Moon',
        style: TextStyle(
          color: Colors.white,
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _stationsDropdownWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DropdownButton<String>(
        
            // Start - Styling dropdown
            dropdownColor: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            isExpanded: true,
            underline: Container(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            value: _selectedStation,
            hint: const Text(
              "Pilih Stasiun",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            // End - Styling dropdown
        
            items: _stationsList.map((station) {
              return DropdownMenuItem<String>(
                value: station,
                child: Text(station, style: const TextStyle(fontSize: 20)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedStation = value;
              });
            }),
      ),
    );
  }
}
