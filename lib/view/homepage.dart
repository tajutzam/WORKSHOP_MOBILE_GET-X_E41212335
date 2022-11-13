import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/demo_controller.dart';
import 'package:getx/controller/purchase.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(Purchase());
  final demoController = Get.find<DemoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Get x - home page"),
          centerTitle: true,
        ),
        bottomSheet: SafeArea(
          child: Card(
            elevation: 12,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const Icon(
                          Icons.shopping_cart_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                        Positioned(
                          right: 5,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orangeAccent,
                            ),
                            child: Center(
                              child:
                                  GetX<DemoController>(builder: (controller) {
                                return Text(
                                  "${controller.cartCount}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                    GetX<DemoController>(
                      builder: (controller) => Text(
                        "Total Amount - ${controller.totalAmount}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 16),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.toNamed('/cart',
                              arguments:
                                  "Home Page to demo page => parsing data argument");
                        },
                        icon: const Icon(Icons.arrow_forward_ios_rounded))
                  ],
                ),
              ),
            ),
          ),
        ),
        body: GetX<Purchase>(
          builder: (controller) => ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    Image.network(
                      "https://picsum.photos/200",
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.products[index].productName,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                controller.products[index].productDescription,
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              demoController
                                  .addToCart(controller.products[index]);
                            },
                            child: Text('shop now'))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
