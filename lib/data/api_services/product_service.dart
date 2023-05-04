import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
 static Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));

    if (response.statusCode == 200) {
      List<dynamic> productsJson = jsonDecode(response.body);
      List<ProductModel> products = productsJson
          .map((productJson) => ProductModel.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
