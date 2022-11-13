import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/demo_controller.dart';
import 'package:getx/view/demopage.dart';
import 'package:getx/view/homepage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DemoController());
    return SimpleBuilder(
      builder: (p0) {
        return GetMaterialApp(
          initialRoute: "/",
          routes: {
            "/": (contect) =>  HomePage(),
            "/cart": (p0) => DemoPage()
          },
          theme: controller.theme,
        );
      },
    );
  }
}
