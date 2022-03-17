import 'package:get/get.dart';

import '../../Constans/colors.dart';

errorSnackBar(String content,{String? title}) {
  return Get.snackbar(
    title ?? "Error",
    content,
    backgroundColor: colorDanger.withOpacity(0.7),
    colorText: colorWhite,
  );
}

warningSnackBar(String content,{String? title}) {
  return Get.snackbar(
    title ?? "Warning", 
    content,
    backgroundColor: colorWarning.withOpacity(0.7),
    colorText: colorWhite,
  );
}

infoSnackBar(String content,{String? title}) {
  return Get.snackbar(
    title ?? "Info",
    content,
    backgroundColor: colorInfo.withOpacity(0.7),
    colorText: colorWhite,
  );
}

successSnackBar(String content,{String? title}) {
  return Get.snackbar(
    title ?? "Success",
    content,
    backgroundColor: colorSuccess.withOpacity(0.7),
    colorText: colorWhite,
  );
}