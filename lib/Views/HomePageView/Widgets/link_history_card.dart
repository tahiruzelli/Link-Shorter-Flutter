import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';

import '../../../Globals/Constans/colors.dart';
import 'copy_button.dart';

class LinkHistoryCard extends StatelessWidget {
  Map datas;
  bool isCopied;
  int index;
  LinkHistoryCard(this.datas, this.isCopied, this.index);
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        child: Text(
                          datas['longLink'],
                          style: TextStyle(
                            color: colorBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        homePageController.removeShortenLinkHistoryList(index);
                        homePageController.setCopiedLinkIndex(-1);
                      },
                      child: SvgPicture.asset('assets/del.svg'),
                    )
                  ],
                ),
              ),
              Container(
                height: 0.5,
                width: Get.width * 0.8,
                color: colorBlack,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  datas['shortenLink'],
                  style: TextStyle(
                    color: colorBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CopyButton(
                  currentIndex: index,
                  isCopied: isCopied,
                  shortLink: datas['shortenLink']),
            ],
          ),
        ),
      ),
    );
  }
}
