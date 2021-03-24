
import 'package:hello_world/util/excepion.dart';

class TheAppService {
  Future<void> init () async {
    await Future.delayed(Duration(seconds: 2));
    try {
      randomException();
    } catch (e) {
      rethrow;
    }
  }
}