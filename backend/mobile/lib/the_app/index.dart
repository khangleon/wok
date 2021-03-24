import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/home/index.dart';
import 'package:hello_world/login/index.dart';
import 'package:hello_world/the_app/controller.dart';
import 'package:hello_world/the_app/init_error.dart';
import 'package:hello_world/the_app/loading.dart';
import 'package:hello_world/the_app/loading_error.dart';

class TheApp extends StatelessWidget {
  final _theAppController = Get.put(TheAppController());
  TheApp() {
    _theAppController.onInit();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(child: GetBuilder(
          init: _theAppController,
          id: "theAppController",
          builder: (TheAppController controller ) {
            if (controller.appStatus == AppStatus.init) {
              print("AppStatus.init");
              return Center(child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
            } else if (controller.appStatus == AppStatus.initError) {
              print("AppStatus.initError");
              return InitErrorPage();
            } else if (controller.appStatus == AppStatus.login){
              return LoginPage();
            } else if (controller.appStatus == AppStatus.loading) {
              return LoadingPage();
            } else if (controller.appStatus == AppStatus.loadingError) {
              return LoadingErrorPage();
            }
            return HomePage();
          }
        )),
      ),
    );
  }
}
