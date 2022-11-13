import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:getx/controller/demo_controller.dart';

class DemoPage extends StatelessWidget {
  DemoPage({super.key});
  final DemoController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Page Get-x'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SwitchListTile(
              value: controller.isDark,
              onChanged: (value) {
                controller.changeTheme(value);
              },
              title: const Text('click , to change theme '),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Snackbar', 'this is snackbar');
              },
              child: const Text('Get snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  content: const Text('ini adalah dialog'),
                  title: 'dialog title',
                );
              },
              child: const Text('dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 100,
                  color: Colors.white,
                  child: const  Center(
                    child: Text(
                      'hello from bottom sheet',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ));
              },
              child: const Text('bottom sheet'),
            )
          ],
        ),
      ),
    );
  }
}
