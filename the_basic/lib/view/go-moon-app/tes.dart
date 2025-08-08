import 'package:flutter/material.dart';

class Tes extends StatefulWidget {
  @override
  State<Tes> createState() => _TesState();
}

class _TesState extends State<Tes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _backgroundImageWidget(),
            _pageTitleWidget(),
          ],
        ),
      ),
    );
  }
}

  Widget _backgroundImageWidget() {
    return Container (
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/moon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _pageTitleWidget() {
    return const Text (
      "Go Moon",
      style: TextStyle(
        fontSize: 70,
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }