class Product {
  String name;
  String description;
  String imagePath;
  double price;
  int itemQuantity;
  bool isAddedToCart = false;

  Product({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.itemQuantity,
    required this.isAddedToCart,
  });
}
