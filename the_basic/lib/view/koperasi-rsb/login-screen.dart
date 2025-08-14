import 'package:flutter/material.dart';
import 'package:the_basic/widget-globals/colors.dart';
import 'package:the_basic/widget-globals/login-regis-page/login-regis-widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: cardLoginRegisWidget(
                title: "Selamat Datang!",
                subtitle: "Silahkan masuk untuk melanjutkan",
                deviceWidth: _deviceWidth,
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
