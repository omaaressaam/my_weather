import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather/core/util/Bloc/cubit/weather_cubit.dart';
import 'package:my_weather/core/util/network/remote/dio_helper.dart';

import 'features/weather/pages/Weatherpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Weatherbloc()..getCurrentWeather(),
      child: MaterialApp(
        title: 'Weather',
        theme: ThemeData(scaffoldBackgroundColor: Colors.lightBlue),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
