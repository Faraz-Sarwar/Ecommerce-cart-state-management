import 'package:flutter/widgets.dart';
import 'package:persistent_cart_app/model/product_model.dart';
import 'package:hive/hive.dart';

class CartProvider with ChangeNotifier {
  final Box<Product> _cartBox = Hive.box<Product>('cartBox');

  List<Product> get itemList => _cartBox.values.toList();

  void addItemInCart(Product product) {
    _cartBox.add(product);
    product.isAddedToCart = true;
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartBox.deleteAt(index);
    notifyListeners();
  }

  void incrementItemQuanitity(int index) {
    final product = _cartBox.getAt(index);
    if (product != null) {
      product.itemQuantity++;
      notifyListeners();
    }
  }

  void decrementItemQuanitity(int index) {
    final product = _cartBox.getAt(index);
    if (product != null && product.itemQuantity > 1) {
      product.itemQuantity--;
      notifyListeners();
    }
  }
}
