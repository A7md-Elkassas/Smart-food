import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class LocationController with ChangeNotifier {
  Future<String?> getPlaceAddress(double lat, double lng) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
    return placeMarks[0].street;
  }
}
