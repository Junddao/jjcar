import 'package:flutter/cupertino.dart';
import 'package:jjcar/model/model_car.dart';

class ProviderCar extends ChangeNotifier {
  List<ModelCar> cars = [];
  void getCar(Map<String, dynamic> json) {
    final carInfos = List.from(json['cars']);
    for (var element in carInfos) {
      ModelCar modelCar = ModelCar();
      modelCar.maker = element['maker'];
      modelCar.name = element['name'];
      modelCar.price = element['price'];
      modelCar.fuel = element['fuel'];
      modelCar.type = element['type'];
      modelCar.logoImage = element['logoImage'];
      modelCar.carImage = element['carImage'];
      modelCar.locale = element['locale'];
      cars.add(modelCar);
    }
  }
}
