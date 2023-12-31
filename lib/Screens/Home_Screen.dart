import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/Utils/SnackBar_MediaQuery.dart';
import 'package:flutter_weather_app/Widgets/Home_background_widget.dart';
import 'package:flutter_weather_app/Widgets/weather_widget.dart';
import 'package:flutter_weather_app/bloc/weather_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              HomeBackgroundWidget(),
              BlocBuilder<WeatherBloc, WeatherBlocState>(
                builder: (context, state) {
                  if (state is WeatherSucessState) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${state.weather.areaName}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                           Center(child: Utils().getWeatherIcon(state.weather.weatherConditionCode as int)),
                            SizedBox(
                              height: 8,
                            ),
                            Center(
                                child: Text(
                              '${state.weather.weatherMain} - ${state.weather.weatherDescription}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )),
                            Center(
                                child: Text(
                              "${state.weather.temperature!.celsius!.floor()}°C",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold),
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width * 0.8,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Text(
                                DateFormat("EEEE dd •").add_jm().format(state.weather.date!),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Container(
                                height: 2,
                                width: MediaQuery.of(context).size.width * 0.8,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            WeatherWidget(
                              backgroundImage: 'assets/Images/sunrise.jpg',
                              IconImage: 'assets/Images/11.png',
                              Time_or_Temprature: DateFormat().add_jm().format(state.weather.sunrise!),
                              callback: () {
                                Utils().ShowSnackBar(
                                    context: context,
                                    content: "Today Sunrise Time : ${DateFormat().add_jm().format(state.weather.sunrise!)}");
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            WeatherWidget(
                              backgroundImage: 'assets/Images/sunset.jpg',
                              IconImage: 'assets/Images/12.png',
                              Time_or_Temprature: DateFormat().add_jm().format(state.weather.sunset!),
                              callback: () {
                                Utils().ShowSnackBar(
                                    context: context,
                                    content: "Today Sunset Time :${DateFormat().add_jm().format(state.weather.sunset!)}");
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            WeatherWidget(
                              backgroundImage: 'assets/Images/temprature.jpg',
                              IconImage: 'assets/Images/13.png',
                              Time_or_Temprature: '${state.weather.tempMax!.celsius!.round().toString()}°C',
                              callback: () {
                                Utils().ShowSnackBar(
                                    context: context,
                                    content: "Today Maximum Tepmrature : ${state.weather.tempMax!.celsius!.round()}°C");
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            WeatherWidget(
                              backgroundImage: 'assets/Images/temprature.jpg',
                              IconImage: 'assets/Images/14.png',
                              Time_or_Temprature: '${state.weather.tempMin!.celsius!.round().toString()}°C',
                              callback: () {
                                Utils().ShowSnackBar(
                                    context: context,
                                    content: "Today Maximum Tepmrature : ${state.weather.tempMin!.celsius!.round()}°C");
                              },
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
