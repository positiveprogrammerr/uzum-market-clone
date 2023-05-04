import 'package:uzum_clone/data/models/product_model.dart';

class CartItem {
  late ProductModel product;
  late int quantity;
  late double price;

  CartItem({required this.product, this.quantity = 1}) 
      : price = product.price!;

  //...
}
