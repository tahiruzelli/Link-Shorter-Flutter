import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Controllers/HomePageController/home_page_controller.dart';
import '../../Globals/Constans/colors.dart';
import 'Widgets/botom_bar.dart';
import 'Widgets/link_history_card.dart';

class HomePageView extends StatelessWidget {
  HomePageController homePageController = Get.put(HomePageController());
  HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xfff0f1f6),
        appBar: AppBar(
          backgroundColor: const Color(0xfff0f1f6),
          title: homePageController.getShortenLinkHistoryList.isEmpty
              ? SvgPicture.asset('assets/logo.svg')
              : Text(
                  'Your Link History',
                  style: TextStyle(
                    color: colorBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Stack(
          children: [
            homePageController.getShortenLinkHistoryList.isEmpty
                ? emptyPage()
                : ListView.builder(
                    itemCount:
                        homePageController.getShortenLinkHistoryList.length,
                    itemBuilder: (context, index) {
                      return LinkHistoryCard(
                        homePageController.getShortenLinkHistoryList[index],
                        homePageController.getCopiedLinkIndex == index
                            ? true
                            : false,
                        index,
                      );
                    },
                  ),
            Positioned(
              bottom: 0,
              child: CustomBottomBar(),
            )
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
            'assets/illustration.svg',
            height: Get.height * 0.4,
            width: Get.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          "Let's get started!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: colorBlack,
          ),
        ),
        SizedBox(
          width: Get.width * 0.75,
          child: Text(
            "Paste your first link into the field to shorten it",
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
