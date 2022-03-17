import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    'Home Page Controller Test',
    () {
      Get.testMode = true;
      test(
        'Set Copied Link Index Test',
        () {
          MainController mainController = Get.put(MainController());
          HomePageController homePageController = Get.put(HomePageController());
          homePageController.setCopiedLinkIndex(0);
          expect(0, homePageController.getCopiedLinkIndex);
        },
      );

      test(
        'Add And Remove Shorten Link History List',
        () {
          MainController mainController = Get.put(MainController());
          HomePageController homePageController = Get.put(HomePageController());
          int tmpLenght = homePageController.getShortenLinkHistoryList.length;
          homePageController.addShortenLinkHistoryList(
              longLink: "tahiruzelli.com", shortenLink: "thr12.com");
          expect(tmpLenght + 1,
              homePageController.getShortenLinkHistoryList.length);
          homePageController.removeShortenLinkHistoryList(0);
          expect(
              tmpLenght, homePageController.getShortenLinkHistoryList.length);
        },
      );

      test(
        'On Shorten It Button Pressed Test',
        () {
          MainController mainController = Get.put(MainController());
          HomePageController homePageController = Get.put(HomePageController());
          homePageController.onShortenItButtonPressed();
          expect(homePageController.errorStatus.value, true);
        },
      );
    },
  );
}
