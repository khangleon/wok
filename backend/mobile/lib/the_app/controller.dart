import 'package:get/get.dart';
import 'package:hello_world/the_app/service.dart';

enum AppStatus {
  init, initError, login, loading, loadingError, loaded
}

class TheAppController extends GetxController {
  final _service = Get.put(TheAppService());
  AppStatus appStatus = AppStatus.init;

  void setStatus (AppStatus newStatus) {
    appStatus = newStatus;
    update(["theAppController"]);
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    setStatus(AppStatus.init);
    try {
      await _service.init();
      setStatus(AppStatus.login);
    } catch (e) {
      setStatus(AppStatus.initError);
    }
  }
}