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
      print(e);
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
      print(e);
    }
    return [];
  }
}
