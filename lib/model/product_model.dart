import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String imagePath;

  @HiveField(3)
  double price;

  @HiveField(4)
  int itemQuantity;

  @HiveField(5)
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
