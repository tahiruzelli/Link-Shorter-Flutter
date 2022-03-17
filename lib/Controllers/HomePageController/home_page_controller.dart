import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:link_shorter/Controllers/MainController/main_controller.dart';
import 'package:link_shorter/Globals/Constans/strings.dart';
import 'package:link_shorter/Globals/Widgets/Alerts/custom_snackbar.dart';
import 'package:link_shorter/Models/in_storage_shorten_link_model.dart';
import '../../Globals/Constans/get_storage_keys.dart';
import '../../Repositories/LinkShorterRepository/link_shorter_repository.dart';

class HomePageController extends GetxController {
  MainController mainController = Get.find();
  RxBool errorStatus = RxBool(false);
  final TextEditingController _shortenLinkController = TextEditingController();
  get getShortenLinkController => _shortenLinkController;

  RxInt copiedLinkIndex = RxInt(0);
  RxInt get getCopiedLinkIndex => copiedLinkIndex;
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
    List? tmp = GetStorage().read(shortenLinkHistoryKey);
    tmp ??= [];
    _shortenLinkHistoryList?.value =
        (tmp).map((e) => InStorageShortenLinkModel.fromJson(e)).toList();
  }

  final RxList<InStorageShortenLinkModel>? _shortenLinkHistoryList =
      <InStorageShortenLinkModel>[].obs;
  List<InStorageShortenLinkModel> get getShortenLinkHistoryList =>
      _shortenLinkHistoryList!;

  void addShortenLinkHistoryList(
      {required String longLink, required String shortenLink}) async {
    Map<String, dynamic> tmp = {
      'longLink': longLink,
      'shortenLink': shortenLink,
    };
    if (_shortenLinkHistoryList == null) {
      _shortenLinkHistoryList?.value = [];
    }
    _shortenLinkHistoryList!.add(InStorageShortenLinkModel.fromJson(tmp));
    await GetStorage().write(
      shortenLinkHistoryKey,
      InStorageShortenLinkModel().toMap(
        _shortenLinkHistoryList ?? [],
      ),
    );
  }

  void removeShortenLinkHistoryList(int index) async {
    _shortenLinkHistoryList!.removeAt(index);
    await GetStorage().write(shortenLinkHistoryKey,
        InStorageShortenLinkModel().toMap(_shortenLinkHistoryList!));
  }

  Future getShortLink(String longLink) async {
    LinkShorterRepository linkShorterRepository = LinkShorterRepository();
    var result = await linkShorterRepository.getShortLink(longLink);
    if (result.ok!) {
      return result.result;
    } else {
      errorSnackBar(result.error ?? unknownError);
      return null;
    }
  }

  void onShortenItButtonPressed() {
    if (_shortenLinkController.text == '' ||
        _shortenLinkController.text.isEmpty) {
      errorStatus.value = true;
      _shortenLinkController.clear();
      warningSnackBar("Link can not be empty");
    } else if (!GetUtils.isURL(_shortenLinkController.text)) {
      errorStatus.value = true;
      _shortenLinkController.clear();
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
