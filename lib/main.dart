import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';

import 'Views/HomePageView/home_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Link Shorter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePageView(),
    );
  }
}
