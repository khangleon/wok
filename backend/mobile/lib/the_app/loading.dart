import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/the_app/controller.dart';

class LoadingPage extends StatelessWidget {
  final TheAppController _theAppController = Get.find();

  LoadingPage() {
    Future.delayed(Duration(seconds: 3)).then((_){
      _theAppController.setStatus(AppStatus.loaded);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(),),
    );
  }
}
