import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';
import 'package:link_shorter/Globals/Constans/colors.dart';
import '../../Models/slider_model.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SliderPage> {
  List<SliderModel> mySLides = [];
  int slideIndex = 0;
  PageController? controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.grey : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  'assets/logo.svg',
                  height: 50,
                  width: Get.width,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                children: List.generate(mySLides.length, (index) {
                  return SlideTile(
                    title: mySLides[index].getTitle(),
                    desc: mySLides[index].getDesc(),
                  );
                }),
              ),
            ),
          ],
        ),
        bottomSheet: SizedBox(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    i == slideIndex
                        ? _buildPageIndicator(true)
                        : _buildPageIndicator(false),
                ],
              ),
              FlatButton(
                onPressed: () {
                  MainController mainController = Get.find();
                  mainController.onSkipButtonPressed();
                },
                splashColor: Colors.blue[50],
                child: const Text(
                  "Skip",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SlideTile extends StatelessWidget {
  String? imagePath, title, desc;

  SlideTile({this.imagePath, this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Get.width / 10,
        vertical: Get.height / 4,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Get.height / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      title!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text(
                    desc!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: colorPurple,
              child: const Icon(
                Icons.track_changes,
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
