import 'package:flutter/material.dart';

import '../utils/colores.dart';
import '../utils/size.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi\nI am Abdul Bari \nSelf Thought Flutter Developer',
                style: TextStyle(
                    height: 1.5,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.whitePrimary),
              ),
              sizeH15,
              SizedBox(
                width: 300,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.amber), // Change the color here
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Get in touch',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
          Image.asset(
            'assets/my.png',
            width: screenWidth / 2,
          ),
        ],
      ),
    );
  }
}
