class Resturants {
  final List<dynamic>? resturants;
  Resturants({this.resturants});
  factory Resturants.fromJson(Map<String, dynamic> json) {
    return Resturants(
      resturants: json['return'],
    );
  }
}
