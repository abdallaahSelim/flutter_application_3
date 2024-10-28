import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:flutter_application_3/models/weatherModel.dart';
import 'package:flutter_application_3/service/weatherService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "search sity",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.lightBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<Getweathercubit>(context);
              await  getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
                // log(weathermodel!.cityName);
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                suffixIcon: Icon(Icons.search),
                labelText: "search",
                hintText: "enter city name",
                hintStyle: TextStyle(fontWeight: FontWeight.w300),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.lightBlue,
                      width: 2.0), // Border when focused
                ),
              ),
            ),
          ),
        ));
  }
}
