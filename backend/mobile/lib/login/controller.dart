import 'package:get/get.dart';
import 'package:hello_world/login/service.dart';
import 'package:hello_world/the_app/controller.dart';

class LoginController extends GetxController {
  final _service = LoginService();
  final TheAppController _theAppController = Get.find();

  String username = "mankinh";
  String password = "bd";

  Future<void> login() async {
    try {
      await _service.login(password: password, username: username);
      _theAppController.setStatus(AppStatus.loading);
    } catch (e) {
      _theAppController.setStatus(AppStatus.loadingError);
    }
  }
}