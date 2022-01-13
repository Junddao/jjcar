import 'dart:convert';

class ModelCar {
  String? maker;
  String? name;
  int? price;
  int? fuel;
  int? type;
  String? logoImage;
  String? carImage;
  int? locale;
  bool? selected;
  ModelCar({
    this.maker,
    this.name,
    this.price,
    this.fuel,
    this.type,
    this.logoImage,
    this.carImage,
    this.locale,
    this.selected = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'maker': maker,
      'name': name,
      'price': price,
      'fuel': fuel,
      'type': type,
      'logoImage': logoImage,
      'carImage': carImage,
      'locale': locale,
      'selected': selected,
    };
  }

  factory ModelCar.fromMap(Map<String, dynamic> map) {
    return ModelCar(
      maker: map['maker'],
      name: map['name'],
      price: map['price']?.toInt(),
      fuel: map['fuel']?.toInt(),
      type: map['type']?.toInt(),
      logoImage: map['logoImage'],
      carImage: map['carImage'],
      locale: map['locale']?.toInt(),
      selected: map['selected'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelCar.fromJson(String source) =>
      ModelCar.fromMap(json.decode(source));
}
