import 'package:get/get.dart';
import 'package:hello_world/home/service.dart';
import 'package:hello_world/pt/proto/role/role_message.pb.dart';

class HomeController extends GetxController {
  final _service = HomeService();
  final data$ = <Role>[].obs;

  final RxDouble scale$ = RxDouble(1);

  Future<void> find({String filterText}) async {
    try {
      final res = await _service.find(filterText: filterText);
      data$.addAll(res.data);
    } catch (e) {
      print(e);
    }

  }
}
