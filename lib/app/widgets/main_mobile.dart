import 'package:flutter/material.dart';

import '../utils/colores.dart';
import '../utils/size.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: screenHeight,
      constraints: const BoxConstraints(minHeight: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scafoldBG.withOpacity(0.6),
                CustomColor.scafoldBG.withOpacity(0.6),
              ]).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/my.png',
              width: screenWidth,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Hi\nI am Abdul Bari \nSelf Thought Flutter Developer',
            style: TextStyle(
                height: 1.5,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          sizeH15,
          SizedBox(
            height: 40,
            width: 190,
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
    );
  }
}
