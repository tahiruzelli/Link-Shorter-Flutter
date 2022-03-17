import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Globals/Constans/asset_paths.dart';
import 'package:link_shorter/Globals/Constans/strings.dart';
import '../../Controllers/HomePageController/home_page_controller.dart';
import '../../Globals/Constans/colors.dart';
import 'Widgets/bottom_bar.dart';
import 'Widgets/link_history_card.dart';

class HomePageView extends StatelessWidget {
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: colorMainColor,
        appBar: AppBar(
          backgroundColor: colorMainColor,
          title: homePageController.getShortenLinkHistoryList.isEmpty
              ? SvgPicture.asset(logoPath)
              : Text(
                  linkHistory,
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            homePageController.getShortenLinkHistoryList.isEmpty
                ? emptyPage()
                : Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount:
                            homePageController.getShortenLinkHistoryList.length,
                        itemBuilder: (context, index) {
                          return LinkHistoryCard(
                            homePageController.getShortenLinkHistoryList[index],
                            index,
                          );
                        },
                      ),
                    ),
                  ),
            CustomBottomBar()
          ],
        ),
      ),
    );
  }

  emptyPage() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: SvgPicture.asset(
illustrationImagePath,
            height: Get.height * 0.4,
            width: Get.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          letsStart,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: colorBlack,
          ),
        ),
        SizedBox(
          width: Get.width * 0.75,
          child: Text(
            pasteLink,
            style: TextStyle(
              fontSize: 24,
              color: colorBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
