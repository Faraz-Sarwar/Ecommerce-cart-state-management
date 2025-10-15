import 'package:flutter/widgets.dart';
import 'package:persistent_cart_app/model/product_model.dart';
import 'package:hive/hive.dart';

class CartProvider with ChangeNotifier {
  final Box<Product> _cartBox = Hive.box<Product>('cartBox');

  List<Product> get itemList => _cartBox.values.toList();

  int get itemsInCart => itemList.length;

  void addItemInCart(Product product) {
    final alreadyInCart = _cartBox.values.any((p) => p.name == product.name);
    if (!alreadyInCart) {
      _cartBox.add(product);
      notifyListeners();
    }
  }

  void removeItemFromCart(Product product) {
    final keyToRemove = _cartBox.keys.firstWhere(
      (key) => _cartBox.get(key)!.name == product.name,
      orElse: () => null,
    );
    if (keyToRemove != null) {
      _cartBox.delete(keyToRemove);
      notifyListeners();
    }
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

  void toggleAddToCart(Product product) {
    product.isAddedToCart = !product.isAddedToCart;
    final keyToUpdate = _cartBox.keys.firstWhere(
      (key) => _cartBox.get(key)!.name == product.name,
      orElse: () => null,
    );
    if (keyToUpdate != null) {
      _cartBox.put(keyToUpdate, product);
    }
    notifyListeners();
  }
}
