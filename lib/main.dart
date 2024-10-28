import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/bloc.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherCubit.dart';
import 'package:flutter_application_3/cubits/get_weather_cubit/getWeatherState.dart';
import 'package:flutter_application_3/view/homepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = appObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Getweathercubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<Getweathercubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Weather App',
                theme: ThemeData(
                  primarySwatch: getcolormethod(
                      BlocProvider.of<Getweathercubit>(context)
                          .weathermodel
                          ?.weatherCondition),
                ),
                home: Homepage());
          },
        );
      }),
    );
  }
}

MaterialColor getcolormethod(String? condition) {
  // Return default color for null or empty condition
  if (condition == null || condition.isEmpty) {
    return Colors.blue;
  }

  // Make the condition case-insensitive
  condition = condition.toLowerCase();

  // Group similar conditions
  if (condition.contains('sunny') || condition.contains('clear')) {
    return Colors.orange;
  } else if (condition.contains('cloudy') || condition.contains('overcast')) {
    return Colors.grey;
  } else if (condition.contains('mist') || condition.contains('fog')) {
    return Colors.blueGrey;
  } else if (condition.contains('rain') || condition.contains('drizzle')) {
    return Colors.blue;
  } else if (condition.contains('snow') || condition.contains('sleet')) {
    return Colors.teal;
  } else if (condition.contains('thunder')) {
    return Colors.purple;
  } else if (condition.contains('ice pellets') ||
      condition.contains('freezing')) {
    return Colors.cyan;
  } else if (condition.contains('shower')) {
    return Colors.lightBlue;
  }

  // Default color if no match
  return Colors.blue;
}
