import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/util/Bloc/cubit/weather_state.dart';
import '../../../models/forecastmodel.dart';
import '../../network/remote/dio_helper.dart';
import '../../network/remote/end_points.dart';
import 'package:location/location.dart';

class Weatherbloc extends Cubit<WeatherState> {
  static Weatherbloc get(context) => BlocProvider.of<Weatherbloc>(context);

  Weatherbloc() : super(Initial());
  Forecasmodel? forecastt;

  void getCurrentWeather() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    String lat = _locationData.latitude.toString();
    String long = _locationData.longitude.toString();

    print(lat);
    print(long);

    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.weatherapi.com',
        receiveDataWhenStatusError: true,
      ),
    );

    emit(CurrentWeather());

    Response currentWeatherResponse =
        await DioHelper.getData(url: forecast, query: {
      'key': '3abc4ac71f114deb86380405201809',
      'q': '$lat,$long',
      'days': 4,
      'aqi': 'no',
      'alerts': 'no',
    });

    emit(CurrentWeather());

    forecastt = Forecasmodel.fromJson(currentWeatherResponse.data);
    debugPrint('---------------------');
    debugPrint(forecastt?.forecast!.forecastday!.length.toString());
    debugPrint('---------------------');
  }
}
