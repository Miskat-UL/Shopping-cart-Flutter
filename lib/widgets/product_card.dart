import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_flutter/controllers/cart_controller.dart';
import 'package:getx_flutter/models/products.dart';
import 'package:getx_flutter/screens/home.dart';

import '../controllers/product_controller.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int index;
  const ProductCard({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController _cartController = Get.put(CartController());
    final ProductController _controller = Get.put(ProductController());
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.description,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: TextButton(
                  onPressed: () {
                    _cartController.addToCart(_controller.product[index]);
                  },
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
