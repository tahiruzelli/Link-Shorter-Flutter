import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import 'package:link_shorter/Globals/Constans/strings.dart';
import 'package:link_shorter/Globals/Widgets/Alerts/custom_snackbar.dart';

import '../../../Globals/Constans/colors.dart';

class CopyButton extends StatelessWidget {
  late int currentIndex;
  late String shortLink;
  CopyButton({
    Key? key,
    required this.currentIndex,
    required this.shortLink,
  }) : super(key: key);
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          homePageController.setCopiedLinkIndex(currentIndex);
          Clipboard.setData(ClipboardData(text: shortLink)).then((_) {
            successSnackBar(coppySuccessful);
          });
        },
        child: Obx(
          () => Container(
            width: Get.width * 0.8,
            height: Get.height * 0.06,
            decoration: BoxDecoration(
              color: homePageController.getCopiedLinkIndex.value == currentIndex
                  ? colorPurple
                  : colorBlue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                homePageController.getCopiedLinkIndex.value != currentIndex
                    ? 'COPY'
                    : 'COPIED!',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
