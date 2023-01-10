import 'dart:convert';

import 'package:grove_fast/model/model.dart';
import 'package:http/http.dart' as http;

abstract class GetInfo {
  GetInfo._();

  static Future<List<ProductModel?>?> getProduct() async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products");
      final res = await http.get(url);
      return productModelFromJson(res.body);
    } catch (e) {
      // ignore: avoid_print
      print('error1: $e');
    }
    return null;
  }

  static Future<List> getCotegory() async {
    try {
      final url = Uri.parse("https://fakestoreapi.com/products/categories");
      final res = await http.get(url);
      return jsonDecode(res.body);
    } catch (e) {
      // ignore: avoid_print
      print('error2: $e');
    }
    return [];
  }

  static Future<List<ProductModel?>?> getOnly({required String category}) async {
    try {
      final url =
          Uri.parse("https://fakestoreapi.com/products/category/$category");
      final res = await http.get(url);
      print(res.body);
      return productModelFromJson(res.body) ?? [];
      
    } catch (e) {
      // ignore: avoid_print
      print('error3: $e');
    }
    return [];
  }
}
