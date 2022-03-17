import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';

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
            top: 0,
            right: 0,
            child: SvgPicture.asset('assets/shape.svg'),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => CustomTextField(homePageController.errorStatus.value),
              ),
              const SizedBox(height: 20),
              BlueButton(buttonContent: 'SHORTEN IT!'),
            ],
          )
        ],
      ),
    );
  }
}
