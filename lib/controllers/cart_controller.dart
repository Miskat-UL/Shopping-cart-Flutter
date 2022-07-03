import 'package:get/get.dart';

import '../models/products.dart';

class CartController extends GetxController {
  var cartItems = List<Product>.empty(growable: true).obs;

  int get totalAmount => cartItems.fold(0, (sum, item) => sum + item.price);

  int get totalProducts => cartItems.length;

  addToCart(Product product) {
    cartItems.add(product);
    print(totalProducts);
  }
}
