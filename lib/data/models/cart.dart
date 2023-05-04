import 'package:uzum_clone/data/models/product_model.dart';

import 'cart_item.dart';

class Cart {
 static final List<CartItem> _items = [];

  List<CartItem> get items => _items;

 static void addItem(ProductModel product) {
    final index =
        _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price * item.quantity);
  }
    void cearItems(){
      _items.clear();
    }
}