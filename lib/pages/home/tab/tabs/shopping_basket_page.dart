import 'package:flutter/material.dart';
import 'package:uzum_clone/data/models/cart.dart';
import 'package:uzum_clone/data/models/cart_item.dart';

class ShoppingBasketPage extends StatefulWidget {
  const ShoppingBasketPage({Key? key}) : super(key: key);

  @override
  _ShoppingBasketPageState createState() => _ShoppingBasketPageState();
}

class _ShoppingBasketPageState extends State<ShoppingBasketPage> {
  final cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return Dismissible(
            key: Key(item.product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                cart.removeItem(item);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${item.product.title} removed from cart'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child:  const Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              margin: const EdgeInsets.all(20),
              child: ListTile(
                leading: Image.network(item.product.image!,width: 80,height: 80,),
                title: Text(item.product.title!),
                subtitle: Text('${item.price} x ${item.quantity}'),
                trailing: Text('${item.price * item.quantity}'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: ${cart.totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(130, 50),
                  backgroundColor: Color.fromARGB(255, 10, 52, 86)),
                onPressed: () {},
                child: TextButton(
                  onPressed: () {
                   setState(() {
                     cart.cearItems();
                   });
                  },
                  child:Text('Checkout',style: TextStyle(color: Colors.white),),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
