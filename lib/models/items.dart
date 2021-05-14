class Items {
  Items({
    this.prodName,
    this.prodQuantity,
    this.prodPrice,
    this.prodImage,
  });

  String? prodName;
  int? prodQuantity;
  String? prodPrice;
  String? prodImage;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        prodName: json["prod_name"],
        prodQuantity: json["prod_quantity"],
        prodPrice: json["prod_price"],
        prodImage: json["prod_image"],
      );

  Map<String, dynamic> toJson() => {
        "prod_name": prodName,
        "prod_quantity": prodQuantity,
        "prod_price": prodPrice,
        "prod_image": prodImage,
      };
}
