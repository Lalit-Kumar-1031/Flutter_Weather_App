part of 'weather_bloc.dart';

sealed class WeatherBlocState extends Equatable {
  const WeatherBlocState();
  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherBlocState {

}

class WeatherLoadingState extends WeatherBlocState {

}
class WeatherFailureState extends WeatherBlocState {

}
class WeatherSucessState extends WeatherBlocState {
  final Weather weather;

 const WeatherSucessState(this.weather);
  @override
  List<Object> get props => [weather];

}
