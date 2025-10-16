import 'package:flutter/material.dart';
import 'package:persistent_cart_app/Provider/cart_provider.dart';
import 'package:persistent_cart_app/global%20variables/global_variables.dart';
import 'package:provider/provider.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final item = productList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            margin: EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * 0.19,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 42, 41, 41),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  item.imagePath,
                  width: 110,
                  height: 110,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          maxLines: 2,
                          item.description,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${item.price.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () => item.isAddedToCart = !item.isAddedToCart,
                              );
                              item.isAddedToCart
                                  ? provider.addItemInCart(item)
                                  : provider.removeItemFromCart(item);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 45,
                              width: 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: item.isAddedToCart
                                      ? Colors.red
                                      : Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  item.isAddedToCart ? 'Remove' : 'Add to cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
