import './product.dart';

class Resturant {
  Resturant({
    this.restId,
    this.restName,
    this.restImg,
    this.restLocation,
    this.restType,
    this.catId,
    this.rate,
    this.delivery,
    this.open,
    this.close,
    this.products,
  });

  String? restId;
  String? restName;
  String? restImg;
  String? restLocation;
  String? restType;
  int? catId;
  double? rate;
  int? delivery;
  String? open;
  String? close;
  List<Product>? products = [];

  factory Resturant.fromJson(Map<String, dynamic> json) => Resturant(
        restId: json["rest_id"],
        restName: json["rest_name"],
        restImg: json["rest_img"],
        restLocation: json["rest_location"],
        restType: json["rest_type"],
        catId: json["cat_id"],
        rate: json["rate"]?.toDouble()!,
        delivery: json["delivery"],
        open: json["open"],
        close: json["close"],
        products: List<Product>.from(
            json["products"]!.map((x) => Product.fromJson(x))),
      );
}
