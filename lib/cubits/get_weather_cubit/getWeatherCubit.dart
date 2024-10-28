import 'package:dio/dio.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:flutter_application_3/models/weatherModel.dart';
import 'package:flutter_application_3/service/weatherService.dart';
import 'package:flutter_application_3/view/searchPage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Getweathercubit extends Cubit<WeatherState> {
  Getweathercubit() : super(NoWeatherState());
   Weathermodel? weathermodel;
  getWeather({required String cityName}) async {
    try {
    weathermodel =
          (await Weatherservice(Dio()).getCurrentWeathe(cityName: cityName))!;
      emit(WeatherLoudedState(weathermodel!));
    } catch (e) {
      emit(WeatherFailerState(e.toString()));
    }
  }
}
