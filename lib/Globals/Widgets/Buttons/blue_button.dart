import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constans/colors.dart';

class BlueButton extends StatelessWidget {
  late String buttonContent;
  late Function buttonFunction;
  BlueButton(
      {required this.buttonContent, required this.buttonFunction, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          buttonFunction();
        },
        child: Container(
          width: Get.width * 0.8,
          height: Get.height * 0.06,
          decoration: BoxDecoration(
            color: colorBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              buttonContent,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
