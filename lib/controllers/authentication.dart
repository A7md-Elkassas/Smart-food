import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Authentication with ChangeNotifier {
  String? mobile;
  String? password;

  Future<void> login(String mobile, String password) async {
    final url = "https://otlob.accuragroup-eg.net/api/login";

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'mobile': mobile,
          'password': password,
          'access_key': 'Gdka52DASWE3DSasWE742Wq',
          'access_password': 'yH52dDDF85sddEWqPNV7D12sW5e',
        },
      ),
    );
    final responseBody = jsonDecode(response.body);
    if (responseBody['message'] != null) {
      throw Exception(responseBody['message']);
    }

    notifyListeners();
  }
}
