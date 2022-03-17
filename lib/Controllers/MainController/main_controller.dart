import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:link_shorter/Globals/Constans/get_storage_keys.dart';
import 'package:link_shorter/Globals/app_state.dart';
import 'package:link_shorter/Views/IntroViews/intro_view.dart';
import '../../Views/HomePageView/home_page.dart';
import '../HomePageController/home_page_controller.dart';

class MainController extends GetxController {
  late AppState appState;
  bool? isUserSeeIntro;

  void onSkipButtonPressed() {
    isUserSeeIntro = true;
    GetStorage().write(isUserSeeIntroKey, isUserSeeIntro);
    Get.off(HomePageView());
  }

  Widget firstRoute() {
    if (isUserSeeIntro!) {
      return HomePageView();
    } else {
      return IntroView();
    }
  }

  void changeAppState(AppState appState) {
    this.appState = appState;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appState = AppState.DONE;
    isUserSeeIntro = GetStorage().read(isUserSeeIntroKey) ?? false;
  }
}
