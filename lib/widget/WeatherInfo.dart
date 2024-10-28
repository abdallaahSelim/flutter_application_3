import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/models/weatherModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Weatherinfo extends StatelessWidget {
  const Weatherinfo({
    super.key, required this.weather,
  });
  final Weathermodel weather;
  @override
  Widget build(BuildContext context) {
    Weathermodel weatherModel =
        BlocProvider.of<Getweathercubit>(context).weathermodel!;

    return Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [
        getcolormethod(weatherModel.weatherCondition),
        getcolormethod(weatherModel.weatherCondition)[300]!,
        getcolormethod(weatherModel.weatherCondition)[50]!
        
       ],
       begin: Alignment.topCenter,end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Text(
              "update at ${weatherModel.date.hour}:${weatherModel.date.minute}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("asset/images/cloudy.png"),
                ),
                Text(
                  weatherModel.temp.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "maxtemp :${weatherModel.maxTemp.round()} \nminitemp :${weatherModel.minTemp.round()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
