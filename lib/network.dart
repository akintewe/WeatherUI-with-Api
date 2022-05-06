import 'dart:convert';

import 'package:http/http.dart' as http;

const apikey = "145378ce16c7ef500a9fb7159207cfd1";
const city = "Akure";

class Weather {
  final String wind, temperature, humidity, pressure, image, description, city;

  Weather(
      {
        required this.image,
        required this.city,
        required this.wind,
        required this.humidity,
        required this.pressure,
        required this.temperature,
        required this.description});


  factory Weather.formJson(Map<String, dynamic> json) {
    return Weather(
        image: json['weather'][0]['icon'].toString(),
        temperature: json['main']['temp'].toString(),
        city: json['name'].toString(),
        humidity: json['main']['humidity'].toString(),
        pressure: json['main']['pressure'].toString(),
        wind:json['wind']['speed'].toString(),
        description: json['weather'][0]['description'].toString());
  }
}

class Network{
  Future <Weather> getWeather() async {
    var apiurl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric";

    final uri = Uri.parse(apiurl);

    http.Response response = await http.get(uri);

    print(response.body);

    if (response.statusCode == 200) {
      return Weather.formJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load');
    }
  }}
