import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/login/controller.dart';

class LoginPage extends StatelessWidget {
  final  _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _loginController.login();
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
