class Product {
  Product({
    this.prodName,
    this.prodId,
    this.prodPrice,
    this.prodImage,
  });

  String? prodName;
  int? prodId;
  String? prodPrice;
  String? prodImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        prodName: json["prod_name"],
        prodId: json["prod_id"],
        prodPrice: json["prod_price"],
        prodImage: json["prod_image"],
      );
}
