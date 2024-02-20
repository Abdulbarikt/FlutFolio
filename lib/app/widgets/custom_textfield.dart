// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../utils/colores.dart';

class CostumTextField extends StatelessWidget {
  const CostumTextField({
    Key? key,
     this.controller,
     this.maxLine=1,
     this.hintText,
  }) : super(key: key);
  final TextEditingController? controller;
  final int maxLine;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      style: TextStyle(color: CustomColor.scafoldBG),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whiteSecondary,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintText: hintText,
          hintStyle: TextStyle(color: CustomColor.hintDark)),
    );
  }
}
