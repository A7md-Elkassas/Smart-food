class Categories {
  int? id;
  String? name;
  Categories({this.id, this.name});
  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
      );
}
