
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:weather/screen/homescreen.dart';
import 'package:weather/screen/provider/weatherprovider.dart';
import 'package:weather/screen/splashscreen.dart';

void main() {

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> WeatherProvider()),

      ],
      builder: (context,_)=>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/" : (context) => SplachScreen(),
          "HomePage" : (context) => Homescreen(),

        },
      ),),
  );
}
