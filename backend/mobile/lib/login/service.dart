import 'package:flutter/foundation.dart';

class LoginService {
  Future<void> login ({@required String username, @required String password}) async {
    print(username);
    print(password);
    await Future.delayed(Duration(milliseconds: 500));
  }
}