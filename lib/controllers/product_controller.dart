import 'package:get/get.dart';
import 'package:getx_flutter/models/product_list.dart';
import 'package:getx_flutter/models/products.dart';

class ProductController extends GetxController {
  // var product = List.filled(100, Product).obs;
  // List<Product> products = [].obs;
  var product = List<Product>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    var products = productsList;
    product.value = products;
  }
}
