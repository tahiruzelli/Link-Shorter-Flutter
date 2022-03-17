import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';
import 'package:link_shorter/Globals/Widgets/Alerts/custom_snackbar.dart';
import 'package:link_shorter/Globals/app_state.dart';

import '../../Repositories/LinkShorterRepository/link_shorter_repository.dart';

class HomePageController extends GetxController {
  MainController mainController = Get.find();
  RxBool errorStatus = RxBool(false);
  final TextEditingController _shortenLinkController = TextEditingController();
  get getShortenLinkController => _shortenLinkController;

  RxInt copiedLinkIndex = RxInt(0);
  get getCopiedLinkIndex => copiedLinkIndex.value;
  void setCopiedLinkIndex(int value) {
    //teknik olarak mumkun olmasa da listenin uzunlugundan buyuk bir index almamasini sagladim
    if (value <= _shortenLinkHistoryList!.length) {
      copiedLinkIndex.value = value;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    copiedLinkIndex.value = -1;
    _shortenLinkHistoryList?.value =
        GetStorage().read('shortenLinkHistory') ?? [];
    //eger daha once hic kayit olmamissa null olmasindan oturu olacak hatalari
    // bos liste yaparak fixliyorum
  }

  final RxList? _shortenLinkHistoryList = [].obs;
  List get getShortenLinkHistoryList => _shortenLinkHistoryList!;

  void addShortenLinkHistoryList({String? longLink, String? shortenLink}) {
    Map tmp = {
      'longLink': longLink,
      'shortenLink': shortenLink,
    };
    _shortenLinkHistoryList!.add(tmp);
    GetStorage().write('shortenLinkHistory', _shortenLinkHistoryList);
  }

  void removeShortenLinkHistoryList(index) {
    _shortenLinkHistoryList!.removeAt(index);
    GetStorage().write('shortenLinkHistory', _shortenLinkHistoryList);
  }

  Future getShortLink(String longLink) async {
    LinkShorterRepository linkShorterRepository = LinkShorterRepository();
    var result = await linkShorterRepository.getShortLink(longLink);
    if (result.ok!) {
      return result.result;
    } else {
      errorSnackBar(result.error ?? "Unknown Error");
      return null;
    }
  }

  void onShortenItButtonPressed() {
    if (_shortenLinkController.text == '' ||
        _shortenLinkController.text.isEmpty) {
      errorStatus.value = true;
      warningSnackBar("Link can not be empty");
    } else if (!GetUtils.isURL(_shortenLinkController.text)) {
      warningSnackBar("Entered url is not valid");
    } else {
      // Herhangi bir syntax problemi olmadigina emin olduktan sonra api requesti atiyoruz.
      errorStatus.value = false;
      getShortLink(_shortenLinkController.text).then((value) {
        if (value != null) {
          addShortenLinkHistoryList(
              longLink: _shortenLinkController.text,
              shortenLink: value.shortLink);
          _shortenLinkController.clear();
        }
      });
    }
  }
}
