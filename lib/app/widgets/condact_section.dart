import 'package:flutter/material.dart';
import 'package:portfolio_/app/utils/size.dart';

import '../utils/colores.dart';
import '../utils/sms_link.dart';
import 'custom_textfield.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class CondactSection extends StatelessWidget {
  const CondactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          Text(
            'Get in touch',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(
            height: 50,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700, maxHeight: 100),
              child: LayoutBuilder(builder: (context, Constraints) {
                if (Constraints.maxWidth >= kMinDesktopWidth) {
                  return buildNameEmailFieldDesktop();
                }
                return buildNameEmailFieldMobile();
              })),
          const SizedBox(
            height: 15,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const CostumTextField(
              hintText: 'Your Message',
              maxLine: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.amber), // Change the color here
                    ),
                    onPressed: () {},
                    child: const Text('Get in touch',
                        style: TextStyle(color: Colors.black)))),
          ),
          const SizedBox(
            height: 30,
          ),
          ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider()),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLink.github]);
                },
                child: Image.asset(
                  'github.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLink.linkedin]);
                },
                child: Image.asset(
                  'linkedin.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLink.facebook]);
                },
                child: Image.asset(
                  'fb.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLink.instagram]);
                },
                child: Image.asset(
                  'insta.png',
                  width: 28,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Row buildNameEmailFieldDesktop() {
  return const Row(
    children: [
      Flexible(
          child: CostumTextField(
        hintText: 'Your Name',
      )),
      SizedBox(
        width: 15,
      ),
      Flexible(
          child: CostumTextField(
        hintText: 'Your Email',
      )),
    ],
  );
}

Column buildNameEmailFieldMobile() {
  return const Column(
    children: [
      Flexible(
          child: CostumTextField(
        hintText: 'Your Name',
      )),
      SizedBox(
        height: 15,
      ),
      Flexible(
          child: CostumTextField(
        hintText: 'Your Email',
      )),
    ],
  );
}
