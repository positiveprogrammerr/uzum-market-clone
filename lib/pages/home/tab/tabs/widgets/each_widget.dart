import 'package:flutter/material.dart';
import 'package:uzum_clone/data/api_services/product_service.dart';
import 'package:uzum_clone/data/models/product_model.dart';
import '../../../../../data/models/cart.dart';

class EachTab extends StatefulWidget {
  const EachTab({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<EachTab> createState() => _EachTabState();
}

class _EachTabState extends State<EachTab> {
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future:  ProductService.getProductsByCategory(widget.category),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          List<ProductModel>? products = snapshot.data;
          if (products == null || products.isEmpty) {
            return const Center(
              child: Text('No products found.'),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final ProductModel product = products[index];
              return GestureDetector(
                onTap: () {
                  // Handle tap on the product item
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        setState(() {
                        });
                      }, icon: Icon(product.isFavourite?Icons.favorite:Icons.favorite_outline),),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Center(
                            child: Image.network(
                              product.image!,
                              width: 150,
                              height: 160,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          maxLines: 2,
                          product.title!,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              product.price!.toStringAsFixed(2),
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                             Cart.addItem(product);
                            },
                            icon: Icon(Icons.shopping_cart,size: 20,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
