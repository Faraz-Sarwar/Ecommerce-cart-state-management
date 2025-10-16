import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_cart_app/Provider/cart_provider.dart';
import 'package:persistent_cart_app/Screen/cart_list.dart';
import 'package:persistent_cart_app/Widgets/products_list.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);

    return Scaffold(
      drawer: Drawer(),
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => CartList()),
                    );
                  },
                  icon: Icon(Icons.shopping_bag_outlined, size: 30),
                ),
                Positioned(
                  right: 8,
                  top: 0,
                  child: Text(
                    provider.itemsInCart.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        title: Text(
          'Products',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [Expanded(child: ProductsList())]),
    );
  }
}
