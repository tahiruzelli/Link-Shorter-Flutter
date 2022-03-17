import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import 'package:link_shorter/Globals/Widgets/Alerts/custom_snackbar.dart';

import '../../Constans/colors.dart';

class BlueButton extends StatelessWidget {
  late String buttonContent;
  BlueButton({required this.buttonContent, Key? key}) : super(key: key);
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          homePageController.onShortenItButtonPressed();
        },
        child: Container(
          width: Get.width * 0.8,
          height: Get.height * 0.06,
          decoration: BoxDecoration(
            color: colorBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              buttonContent,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
