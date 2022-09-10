import 'package:flutter/material.dart';
import '../../../core/util/Bloc/cubit/weather_cubit.dart';

class current extends StatelessWidget {
  const current({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? temp = Weatherbloc.get(context).forecastt!.current!.tempC;
    String? icon = Weatherbloc.get(context).forecastt!.current!.condition?.icon;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$temp ˚C',
            style: const TextStyle(fontSize: 55, color: Colors.black),
          ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https:$icon'),
                fit: BoxFit.fill,
              ),
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }
}
