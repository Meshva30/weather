import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/homescreen.dart';
import 'package:weather/screen/provider/weatherprovider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homescreen());
  }
}
