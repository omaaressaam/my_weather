import 'package:flutter/material.dart';
import 'package:my_weather/features/weather/widgets/dayforecast.dart';
import 'package:my_weather/features/weather/widgets/tempState.dart';
import 'package:my_weather/features/weather/widgets/weatherInfo.dart';
import '../../../core/models/forecastmodel.dart';
import '../../../core/util/Bloc/cubit/weather_cubit.dart';
import '../widgets/currenttemp.dart';
import '../widgets/sunState.dart';
import '../widgets/todayforecast.dart';
import '../widgets/todaystate.dart';
import '../widgets/currentinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Forecasmodel? f;

  Widget build(BuildContext context) {
    f = Weatherbloc.get(context).forecastt;
    String? cityName = f!.location!.name;

    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            /*leading: const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: null,
            ),*/
            flexibleSpace: FlexibleSpaceBar(
              background: const current(),
              title: Text(
                cityName!,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
                textAlign: TextAlign.start,
              ),
              titlePadding: EdgeInsets.only(left: size.width * 0.05, bottom: 5),
            ),
            backgroundColor: Colors.lightBlue,
            expandedHeight: 180,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                temp(
                    feels: f!.current!.feelslikeC!,
                    isDarkMode: isDarkMode,
                    maxTemp: f!.forecast!.forecastday![0].day!.maxtempC!,
                    minTemp: f!.forecast!.forecastday![0].day!.mintempC!,
                    size: size),
                currentState(
                  isDarkMode: isDarkMode,
                  size: size,
                  state: f!.location!.localtime!,
                ),
                todayForecast(size: size, f: f!, isDarkMode: isDarkMode),
                todaystate(
                  isDarkMode: isDarkMode,
                  s: f!.current!.condition!.text!,
                  size: size,
                ),
                dayForecast(size: size, isDarkMode: isDarkMode, f: f!),
                sunState(
                    isDarkMode: isDarkMode,
                    size: size,
                    rise: f!.forecast!.forecastday![0].astro!.sunrise!,
                    set: f!.forecast!.forecastday![0].astro!.sunset!),
                info(
                  isDarkMode: isDarkMode,
                  size: size,
                  humidity: f!.current!.humidity!,
                  wind: f!.current!.windKph!,
                  uv: f!.current!.uv!,
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
