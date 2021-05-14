class Item {
  Item({
    this.prodName,
    this.prodQuantity,
    this.prodPrice,
    this.prodImage,
  });

  String? prodName;
  int? prodQuantity;
  String? prodPrice;
  String? prodImage;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        prodName: json["prod_name"],
        prodQuantity: json["prod_quantity"],
        prodPrice: json["prod_price"],
        prodImage: json["prod_image"],
      );
}
