import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import '../../Constans/colors.dart';

class CustomTextField extends StatelessWidget {
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2,
          color: homePageController.errorStatus.value
              ? colorRed
              : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Obx(
          () => TextField(
            controller: homePageController.getShortenLinkController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: homePageController.errorStatus.value
                  ? "Please add a link here"
                  : 'Shorten a link here...',
              hintStyle: TextStyle(
                color:
                    homePageController.errorStatus.value ? colorRed : colorGrey,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
