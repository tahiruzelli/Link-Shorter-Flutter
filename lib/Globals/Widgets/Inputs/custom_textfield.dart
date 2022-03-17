import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';

import '../../Constans/colors.dart';

// customTextField(context, bool errosStatus) {
//   MainController mainController = Get.find();
//   return
// }
class CustomTextField extends StatelessWidget {
  late bool errorStatus;
  CustomTextField(this.errorStatus);
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
          color: errorStatus ? colorRed : Colors.transparent,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: TextField(
          controller: homePageController.getShortenLinkController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Shorten a link here...',
            hintStyle: TextStyle(
              color: errorStatus ? colorRed : colorGrey,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
