import 'package:persistent_cart_app/model/product_model.dart';

final List<Product> productList = [
  Product(
    name: 'Pizza',
    description:
        'Cheesy, oven-baked pizza topped with pepperoni and fresh vegetables.',
    imagePath: 'assets/images/pizza.png',
    price: 30,
    itemQuantity: 1,
    isAddedToCart: false,
  ),
  Product(
    name: 'Chicken Burger',
    description:
        'Juicy grilled chicken patty with lettuce and mayo in a soft bun.',
    imagePath: 'assets/images/chicken-burger.png',
    price: 25,
    itemQuantity: 1,
    isAddedToCart: false,
  ),
  Product(
    name: 'Vegitable Burger',
    description:
        'Fresh vegetable burger with lettuce, tomato, and creamy sauce for a healthy bite.',
    imagePath: 'assets/images/vegi-burger.png',
    price: 20,
    itemQuantity: 1,
    isAddedToCart: false,
  ),
  Product(
    name: 'Chicken Crispy Wings',
    description:
        'Crispy, spicy chicken wings tossed in hot sauce perfect for every bite.',
    imagePath: 'assets/images/wings.png',
    price: 28,
    itemQuantity: 1,
    isAddedToCart: false,
  ),
];
