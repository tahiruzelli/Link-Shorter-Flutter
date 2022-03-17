import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import 'package:link_shorter/Views/HomePageView/CustomPaint/RPSCustomPainter.dart';
import '../../../Globals/Constans/colors.dart';
import '../../../Globals/Widgets/Buttons/blue_button.dart';
import '../../../Globals/Widgets/Inputs/custom_textfield.dart';

class CustomBottomBar extends StatelessWidget {
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.225,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.225,
            width: Get.width,
            color: colorPurple,
          ),
          Positioned(
            top: Get.width / 6 + 10,
            left: Get.width * 0.4,
            child: CustomPaint(
              size: Size(Get.width * 0.45,
                  (Get.width * 0.45 * 0.540084388185654).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(),
              const SizedBox(height: 20),
              BlueButton(
                buttonContent: 'SHORTEN IT!',
                buttonFunction: () =>
                    homePageController.onShortenItButtonPressed(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
