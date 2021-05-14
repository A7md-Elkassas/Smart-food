class Items {
  final List<dynamic>? items;

  Items({this.items});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      items: json['return'],
    );
  }
}
