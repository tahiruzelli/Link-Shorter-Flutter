import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:link_shorter/Globals/app_state.dart';

class MainController extends GetxController {
  late AppState appState;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    appState = AppState.DONE;
  }
}
