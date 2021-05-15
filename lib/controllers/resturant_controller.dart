import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/resturants.dart';
import '../models/resturant.dart';

class ResturantController with ChangeNotifier {
  List<Resturant>? _resturant = [];
  Resturant rest = Resturant();
  List<Resturant> get getResturant {
    return [..._resturant!];
  }

  Resturant findById(String id) {
    return _resturant!
        .firstWhere((item) => item.restId == id, orElse: () => Resturant());
  }

  Future<List<Resturant>?>? fetchResturant(int categoryId) async {
    final url =
        'https://otlob.accuragroup-eg.net/api/getResturants?langu=ar&catId=$categoryId';
    final response = await http.get(Uri.parse(url));
    var responseBody = jsonDecode(response.body);
    Resturants resturants = Resturants.fromJson(responseBody);
    List<Resturant> resturantList =
        resturants.resturants!.map((e) => Resturant.fromJson(e)).toList();

    _resturant = resturantList;
    return _resturant;
  }
}
