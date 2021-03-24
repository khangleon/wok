import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_world/the_app/controller.dart';

class LoadingErrorPage extends StatelessWidget {
  final TheAppController _theAppController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Can not load data from the Server!!!"),
            ElevatedButton(
              onPressed: () {
//                _theAppController.onInit();
              },
              child: Text("Retry"),
            ),
          ],
        ),
      ),
    );
  }
}
