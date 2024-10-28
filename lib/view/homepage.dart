import 'package:flutter/material.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:flutter_application_3/view/searchPage.dart';
import 'package:flutter_application_3/widget/NoWeatherBody.dart';
import 'package:flutter_application_3/widget/WeatherInfo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../main.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Getweathercubit, WeatherState>(builder: (context, state) {
        Color appBarColor;

        // تحديد لون AppBar بناءً على حالة الطقس
        if (state is WeatherLoudedState) {
          appBarColor = getcolormethod(state.weathermodel.weatherCondition)[500]!;
        } else {
          appBarColor = Colors.blue; // لون افتراضي عند عدم تحميل الطقس
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: appBarColor,
            title: Text(
              "Weather APP",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchpage()),
                  );
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: state is NoWeatherState
              ? const Noweatherbody()
              : state is WeatherLoudedState
              ? Weatherinfo(weather: state.weathermodel)
              : const Text("Oops, there is an error"),
        );
      }),
    );
  }
}
