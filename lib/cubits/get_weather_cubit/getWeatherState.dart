import 'package:flutter_application_3/models/weatherModel.dart';

class WeatherState {}

class NoWeatherState extends WeatherState {}

class WeatherLoudedState extends WeatherState {
  final Weathermodel weathermodel;

  WeatherLoudedState(this.weathermodel);
}

class WeatherFailerState extends WeatherState {
final  String failerErrorMassege;

  WeatherFailerState(this.failerErrorMassege);
}
