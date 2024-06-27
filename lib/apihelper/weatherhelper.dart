
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../screen/model/weathermodel.dart';



class WeatherApiHelper
{
  WeatherModel? weathermodel;
  Future<WeatherModel?> weatherApiCalling(String location)
  async {
    String apiLink = "https://api.weatherapi.com/v1/current.json?key=6e46df35e2804af1a9775258230904&q=$location&aqi=no";
    Uri uri = Uri.parse(apiLink);
    var response = await http.get(uri);
    var weatherJson = jsonDecode(response.body);
    weathermodel = WeatherModel.fromJson(weatherJson);
    return weathermodel;
  }
}
