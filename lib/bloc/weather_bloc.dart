import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_app/Data/Api_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherBlocState> {
  WeatherBloc() : super(WeatherInitialState()) {
    on<FetchWeather>((event, emit) async{
      emit(WeatherLoadingState());

      try {

        //await Geolocator.checkPermission();
        //await Geolocator.requestPermission();
        print("N-----------o------0");
        WeatherFactory weatherFactory=WeatherFactory(Api_key, language: Language.ENGLISH);
        print("N-----------o");
       // Position position=await Geolocator.getCurrentPosition();
        Weather weather=await weatherFactory.currentWeatherByLocation(event.position.latitude, event.position.longitude);

        print(weather);
        emit(WeatherSucessState(weather));
      } catch (e) {
        emit(WeatherFailureState());
        print("N----Error : ");
        print(e.toString());
      }
    });
  }
}
