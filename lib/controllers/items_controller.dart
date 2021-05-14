import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/item.dart';
import '../models/items.dart';

class ItemsController with ChangeNotifier {
  List<Item> _meals = [];
  List<Item> get getMeals {
    return [..._meals];
  }

  Future<List<Item>> fetchMeals(dynamic restId) async {
    final url =
        'https://otlob.accuragroup-eg.net/api/getItems?restId=$restId&langu=ar';
    final response = await http.get(Uri.parse(url));
    var responseBody = jsonDecode(response.body);
    Items items = Items.fromJson(responseBody);
    List<Item> itemList =
        items.items!.map((item) => Item.fromJson(item)).toList();
    _meals = itemList;
    return itemList;
  }
}
