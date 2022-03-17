import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/HomePageController/home_page_controller.dart';
import 'package:link_shorter/Models/in_storage_shorten_link_model.dart';

import '../../../Globals/Constans/colors.dart';
import 'copy_button.dart';

class LinkHistoryCard extends StatelessWidget {
  InStorageShortenLinkModel shortenLink;
  int index;
  LinkHistoryCard(this.shortenLink, this.index);
  HomePageController homePageController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
        left: 20,
        right: 20,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        shortenLink.longLink ?? "",
                        style: TextStyle(
                          color: colorBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
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
                  shortenLink.shortenLink ?? "",
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
                shortLink: shortenLink.shortenLink ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
