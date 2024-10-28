import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Weathermodel {
  final String cityName;

  final DateTime date;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String? image;
  final String weatherCondition;

  Weathermodel(
      {required this.cityName,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      this.image,
      required this.weatherCondition});
  factory Weathermodel.fromJson(json) {
    return Weathermodel(
        cityName: json['location']['name'],
        date: DateTime.parse(json["current"]['last_updated']),
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherCondition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"]);
  }
}
