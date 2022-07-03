import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/cart_controller.dart';
import 'package:getx_flutter/controllers/product_controller.dart';

import '../widgets/product_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    return Scaffold(
        appBar: appbarBuilder(),
        body: Column(children: [
          Expanded(
            child: GetX<ProductController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.product.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: controller.product[index],
                    index: index,
                  );
                },
              );
            }),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: GetX<CartController>(builder: (controller) {
                return Text(
                  '\$${controller.totalAmount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                );
              }),
            ),
          )
        ]));
  }
}

AppBar appbarBuilder() {
  return AppBar(
    backgroundColor: Colors.black87,
    leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {}),
    title: const Text('GetX Flutter'),
    actions: [
      Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: IconButton(
              // alignment: Alignment.center,
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                size: 35,
              ),
            ),
          ),
          Positioned(
              right: 5,
              child: Container(
                width: 20,
                alignment: Alignment.center,
                child: GetX<CartController>(builder: (controller) {
                  return Text(
                    '${controller.totalProducts}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  );
                }),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20)),
              )),
        ],
      ),
    ],
  );
}
