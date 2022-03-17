import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';
import 'package:link_shorter/Globals/app_state.dart';
import 'package:test/test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.testMode = true;
  group(
    'Main Controller Test',
    () {
      Random random = Random();
      test(
        'Skip Button Pressed Test',
        () {
          MainController mainController = Get.put(MainController());
          mainController.onSkipButtonPressed();

          expect(true, mainController.isUserSeeIntro ?? false);
        },
      );
      test(
        'Change App State Test',
        () {
          MainController mainController = Get.put(MainController());
          int randomInt = random.nextInt(2);
          late AppState appState;
          switch (randomInt) {
            case 0:
              {
                appState = AppState.DONE;
              }
              break;
            case 1:
              {
                appState = AppState.ERROR;
              }
              break;
            case 2:
              {
                appState = AppState.LOADING;
              }
              break;
          }
          mainController.changeAppState(appState);

          expect(appState, mainController.appState);
        },
        retry: 10,
        solo: true
      );
    },
  );
}
