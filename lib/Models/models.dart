import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Providers/Products_Provider.dart';

class ProductProvider {
  final url = Uri.parse("https://fakestoreapi.com/products");
  final urlCategory = Uri.parse("https://fakestoreapi.com/products/categories");

  Future<List<ModelosProducts>> getProducts() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = jsonDecode(body);

      List<ModelosProducts> products = [];

      for (var item in jsonData) {
        products.add(ModelosProducts(
          item["id"],
          item["title"],
          item['price'].toDouble(),
          item['description'],
          item['category'],
          item['image'],
          ProductRating(
            rate: item['rating']['rate'].toDouble(),
            count: item['rating']['count'],
          ),
        ));
      }

      return products;
    } else {
      throw Exception("Falló la conexión");
    }
  }

  Future<List<String>> getCategory() async {
    final response = await http.get(urlCategory);

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      List<String> categoryList = jsonDecode(body).cast<String>();
      return categoryList;
    } else {
      return [];
    }
  }
}
