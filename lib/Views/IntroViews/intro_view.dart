import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Globals/Constans/asset_paths.dart';
import 'package:link_shorter/Globals/Widgets/Buttons/blue_button.dart';
import 'slider_page.dart';

class IntroView extends StatelessWidget {
  TextStyle get titleTextStyle => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 50,
      );
  TextStyle get contentTextStyle => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(logoPath),
          ),
          SvgPicture.asset(illustrationImagePath),
          Text(
            'More than just\nshorter links',
            style: titleTextStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            "Build your brand's recognition and get detailed insight on how your links are performing",
            style: contentTextStyle,
            textAlign: TextAlign.center,
          ),
          BlueButton(
            buttonContent: "START",
            buttonFunction: () {
              Get.off(SliderPage());
            },
          )
        ],
      ),
    );
  }
}
