import 'package:flutter/material.dart';

import '../utils/colores.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      width: double.maxFinite,
      child: Text(
        'Made by Abdul Bari with Flutter 3.19',
        style: TextStyle(
            fontWeight: FontWeight.w400, color: CustomColor.whiteSecondary),
      ),
      // color: Colors.blueGrey,
    );
  }
}
