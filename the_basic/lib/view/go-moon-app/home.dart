import 'package:flutter/material.dart';

class GoMoonHome extends StatefulWidget {
  @override
  State<GoMoonHome> createState() => _GoMoonHomeState();
}

class _GoMoonHomeState extends State<GoMoonHome> {
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

  // Daftar pilihan jarak
  final List<String> _distanceList = [
    'Low Earth Orbit (LEO)',
    'Geostationary Orbit (GEO)',
    'Moon Orbit',
    'Mars Orbit',
  ];
  // Nilai yang dipilih (default: null)
  String? _selectedDistance;

  final List<String> _priceList = [
    'Rp 1.000.000',
    'Rp 5.000.000',
  ];
  // Nilai yang dipilih (default: null)
  String? _selectedPrice;

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bagian atas (judul + row dropdown)
                Expanded(
                  child: Column(
                    children: [
                      _pageTitleWidget(),

                    ],
                  ),
                ),

                // Bagian bawah (dropdown stasiun)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: _deviceWidth * 0.05,
                    vertical: _deviceHeight * 0.05,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _stationsDistanceDropdownWidget()),
                          SizedBox(width: _deviceWidth * 0.05),
                          Expanded(child: _stationsPriceDropDownWidget()),
                        ],
                      ),
                      SizedBox(height: _deviceHeight * 0.02),
                      _stationsDropdownWidget(),
                    ],
                  ),
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

  Widget _stationsDistanceDropdownWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
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
          value: _selectedDistance,
          hint: const Text(
            "Pilih Jarak",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          // End - Styling dropdown
          items: _distanceList.map((distance) {
            return DropdownMenuItem<String>(
              value: distance,
              child: Text(distance),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedDistance = value;
            });
          }),
    );
  }

  Widget _stationsPriceDropDownWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
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
          value: _selectedPrice,
          hint: const Text(
            "Pilih Harga",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          // End - Styling dropdown

          items: _priceList.map((price) {
            return DropdownMenuItem<String>(
              value: price,
              child: Text(price),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedDistance = value;
            });
          }),
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
              style: TextStyle(color: Colors.white, fontSize: 20),
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
