class WeatherModel{
  Location? location;
  Current? current;

  WeatherModel({this.location, this.current});

  factory WeatherModel.fromJson(Map json){
    return WeatherModel(
      location: Location.formJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }
}

class Location{
  String? location;

  Location({this.location});

  factory Location.formJson(Map json){
    return Location(
      location: json['name'],
    );
  }
}

class Current{
  num? tempC;
  Condition? condition;
  int? isDay;

  Current({this.tempC, this.condition, this.isDay});

  factory Current.fromJson(Map json){
    return Current(
      tempC: json['temp_c'],
      condition: Condition.fromJson(json['condition']),
      isDay: json['is_day'],
    );
  }
}

class Condition{
  String? text;

  Condition({this.text});

  factory Condition.fromJson(Map json){
    return Condition(
      text: json['text'],
    );
  }
}