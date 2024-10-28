import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_3/models/weatherModel.dart';

class Weatherservice {
  final Dio dio;
  final String baseUrl = "https://api.weatherapi.com/v1";
  final String apiKey = "fa342118af124e0aa88225513241310";

  Weatherservice(this.dio);

  Future<Weathermodel?> getCurrentWeathe({required String cityName}) async {
    try {
      Response response = await dio
          .get("http://api.weatherapi.com/v1/forecast.json?key=3c8596d23a6341adb4b192306242110&q=$cityName&days=1&aqi=no&alerts=no");
      Weathermodel weathermodel = Weathermodel.fromJson(response.data);
      return weathermodel;
    }
     on DioException catch (e) {
      // TODO
      final String errMassege = e.response?.data['error']['message'] ??
          'opps there was an error  , try later';
      throw Exception(errMassege);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error  , try later');
    }
  }
}
