import 'package:flutter/material.dart';
import 'package:persistent_cart_app/Provider/cart_provider.dart';
import 'package:persistent_cart_app/Screen/item_list.dart';
import 'package:persistent_cart_app/Widgets/cart_item_list.dart';
import 'package:persistent_cart_app/model/product_model.dart';
import 'package:provider/provider.dart';
import 'package:persistent_cart_app/Provider/cart_provider.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    double calculateTotalPrice(CartProvider provider) {
      double total = 0;
      for (var i in provider.itemList) {
        total += i.price * i.itemQuantity;
      }
      return total;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: CartItemList()),

          //total price at the bottom
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 42, 41, 41),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${calculateTotalPrice(provider).toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
