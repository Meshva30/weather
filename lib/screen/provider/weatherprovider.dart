
import 'package:flutter/material.dart';

import '../../apihelper/weatherhelper.dart';
import '../model/weathermodel.dart';


class WeatherProvider extends ChangeNotifier{
  String location = "surat";
  WeatherModel? weathermodel;

  Future<WeatherModel?> weatherJsonParsing(String location)
  async {
    weathermodel = await WeatherApiHelper().weatherApiCalling(location);
    return weathermodel;
    notifyListeners();
  }

  void changeLocation(String newLocation)
  {
    location = newLocation;
    notifyListeners();
    weatherJsonParsing(newLocation);
  }
}
