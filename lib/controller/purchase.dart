import 'package:get/get.dart';
import 'package:getx/model/product.dart';

class Purchase extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    // ignore: todo
    fetchProduct();
    super.onInit();
    
  }
  fetchProduct() async {
    await Future.delayed(const Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          productName: 'product one',
          productImage: 'aby',
          productDescription: 'this is product one',
          price: 300.0),
      Product(
          id: 1,
          productName: 'product two',
          productImage: 'aby',
          productDescription: 'this is product two',
          price: 300.0),
      Product(
          id: 1,
          productName: 'product tree',
          productImage: 'aby',
          productDescription: 'this is product tree',
          price: 300.0),
      Product(
          id: 1,
          productName: 'product four',
          productImage: 'aby',
          productDescription: 'this is product four',
          price: 300.0),
      Product(
          id: 1,
          productName: 'product five',
          productImage: 'aby',
          productDescription: 'this is product five',
          price: 300.0),
      Product(
          id: 1,
          productName: 'product six',
          productImage: 'aby',
          productDescription: 'this is product six',
          price: 300.0),
    ];
    products.value = serverResponse;
  }
}
