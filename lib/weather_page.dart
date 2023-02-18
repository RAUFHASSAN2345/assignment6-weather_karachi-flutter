import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  WeatherData? _data;

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=f5783e1fee68d6228723ecc46804ee40'));
    if (response.statusCode == 200) {
      setState(() {
        final data = json.decode(response.body);
        _data = WeatherData.fromJson(data);
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _data == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60)),
                        child: Image.asset(
                          'assets/weatherhome-image.jpg',
                          fit: BoxFit.fill,
                          height: 560,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'country : ${_data!.country}',
                                    style: TextStyle(
                                        fontSize: 23,
                                        color:
                                            Color.fromARGB(255, 211, 208, 208),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 60, bottom: 75),
                                child: Text(
                                  '${_data!.cityName}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '${_data!.temperature}°C',
                                  style: TextStyle(
                                      fontSize: 80,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                '${_data!.main}',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Color.fromARGB(255, 211, 208, 208),
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 75),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'temp_min',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'feels_like',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'humidity',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${_data!.temp_min}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${_data!.feels_like}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${_data!.humidity}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'temp_max',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'pressure',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'visibility',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${_data!.temp_max}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${_data!.pressure}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          '${_data!.visibility}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Information',
                          style: TextStyle(
                              color: Color.fromARGB(255, 211, 208, 208),
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 228,
                                width: 228,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'weather',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 10),
                                      child: Text(
                                        'id : ${_data!.weather_id}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'icon : ${_data!.icon}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Text(
                                        'main : ${_data!.main}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'description : ${_data!.description}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 228,
                                width: 228,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'sys',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 10),
                                      child: Text(
                                        'type : ${_data!.type}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                        'id : ${_data!.sys_id}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'sunrise : ${_data!.sunrise}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'sunset : ${_data!.sunset}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 228,
                                width: 228,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Wind',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 10),
                                      child: Text(
                                        'deg : ${_data!.deg}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'speed : ${_data!.speed}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 228,
                                width: 228,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'coord',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 10),
                                      child: Text(
                                        'lon : ${_data!.lon}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'lat : ${_data!.lat}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              Container(
                                height: 228,
                                width: 228,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.grey, width: 2)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'other info',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, bottom: 10),
                                      child: Text(
                                        'cod : ${_data!.cod}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'clouds_all : ${_data!.clouds_all}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: Text(
                                        'id : ${_data!.id}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      'dt : ${_data!.dt}',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 211, 208, 208),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'timezone : ${_data!.timezone}',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 211, 208, 208),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class WeatherData {
  final String cityName;
  final double temperature;
  final String description;
  final String main;
  final String country;
  final double temp_min;
  final double temp_max;
  final int pressure;
  final int humidity;
  final int visibility;
  final double feels_like;
  final double speed;
  final int deg;
  final int type;
  final int sys_id;
  final int sunrise;
  final int sunset;
  final double lon;
  final double lat;
  final int weather_id;
  final String icon;
  final int clouds_all;
  final int cod;
  final int timezone;
  final int id;
  final int dt;
  WeatherData(
      {required this.cityName,
      required this.temperature,
      required this.description,
      required this.country,
      required this.temp_min,
      required this.temp_max,
      required this.humidity,
      required this.pressure,
      required this.visibility,
      required this.feels_like,
      required this.speed,
      required this.deg,
      required this.type,
      required this.sys_id,
      required this.sunrise,
      required this.sunset,
      required this.lon,
      required this.lat,
      required this.weather_id,
      required this.main,
      required this.icon,
      required this.clouds_all,
      required this.cod,
      required this.timezone,
      required this.id,
      required this.dt});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];

    return WeatherData(
        cityName: json['name'],
        temperature: json['main']['temp'],
        description: weather['description'],
        country: json['sys']['country'],
        temp_min: json['main']['temp_min'],
        temp_max: json['main']['temp_max'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        visibility: json['visibility'],
        feels_like: json['main']['feels_like'],
        speed: json['wind']['speed'],
        deg: json['wind']['deg'],
        type: json['sys']['type'],
        sys_id: json['sys']['id'],
        sunrise: json['sys']['sunrise'],
        sunset: json['sys']['sunset'],
        lon: json['coord']['lon'],
        lat: json['coord']['lat'],
        weather_id: weather['id'],
        main: weather['main'],
        icon: weather['icon'],
        clouds_all: json['clouds']['all'],
        cod: json['cod'],
        timezone: json['timezone'],
        id: json['id'],
        dt: json['dt']);
  }
}
