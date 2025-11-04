import 'package:flutter/material.dart';
import 'package:the_basic/widgets/dropdown_custom.dart';

class GoMoon extends StatefulWidget {
  const GoMoon({super.key});

  @override
  State<GoMoon> createState() => _GoMoonState();
}

class _GoMoonState extends State<GoMoon> {
  @override
  Widget build(BuildContext context) {
    late double deviceHeight = MediaQuery.of(context).size.height;
    late double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: SizedBox(
          height: deviceHeight,
          width: deviceWidth,
          child: Padding(
            padding: EdgeInsets.all(deviceWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pageTitleWidget(),
                astroImageWidget(),
                destinationDropdownWidget(),
                travellerInformationWidget()
              ],
            ),
          ),
        )));
  }

  Widget astroImageWidget() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/moon.png'),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget pageTitleWidget() {
    return const Text(
      'GO MOON',
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget destinationDropdownWidget() {
    List<String> destinations = ['Moon', 'Mars', 'Jupiter', 'Saturn'];

    return Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(53, 53, 53, 1.0),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.all(8),
        child: CustomDropdown(
            value: destinations,
            width: double.infinity,
            hintText: 'Select Destination'));
  }

  Widget travellerInformationWidget() {
    List<String> destinations = ['Moon', 'Mars', 'Jupiter', 'Saturn'];

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: CustomDropdown(
              value: destinations,
              width: double.infinity,
              hintText: 'Travellers',
            ),
          ),
          const SizedBox(width: 16), // << jarak antar dropdown
          Expanded(
            child: CustomDropdown(
              value: destinations,
              width: double.infinity,
              hintText: 'Class',
            ),
          ),
        ],
      ),
    );
  }
}
