import 'package:flutter/material.dart' hide CarouselController;

class WeatherLocation {
  final String city;
  final String dateTime;
  final String temparature;
  final String weatherType;
  final String iconUrl;
  final int wind;
  final int rain;
  final int humidity;
  final String bgUrl;

  WeatherLocation({
    required this.city,
    required this.dateTime,
    required this.temparature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.rain,
    required this.humidity,
    required this.bgUrl,
  });
}

final locationList = [
  WeatherLocation(
    city: 'Kalipare',
    dateTime: '09:41 Monday, 9 Nov 2025',
    temparature: '24\u2103',
    weatherType: 'Night',
    iconUrl: 'assets/moon.svg',
    wind: 10,
    rain: 2,
    humidity: 10,
    bgUrl: 'assets/night.jpg',
  ),
  WeatherLocation(
    city: 'Sumberpucung',
    dateTime: '09:41 — Monday, 9 Nov 2025',
    temparature: '15\u2103',
    weatherType: 'Cloudy',
    iconUrl: 'assets/cloudy.svg',
    wind: 8,
    rain: 7,
    humidity: 82,
    bgUrl: 'assets/cloudy.jpeg'
  ),
  WeatherLocation(
    city: 'Kepanjen',
    dateTime: '09:41 — Monday, 9 Nov 2025',
    temparature: '17\u2103',
    weatherType: 'Sunny',
    iconUrl: 'assets/sun.svg',
    wind: 5,
    rain: 15,
    humidity: 61,
    bgUrl: 'assets/sunny.jpg',
  ),
  WeatherLocation(
    city: 'Malang',
    dateTime: '09:41 — Monday, 9 Nov 2025',
    temparature: '10\u2103',
    weatherType: 'Rainy',
    iconUrl: 'assets/rain.svg',
    wind: 20,
    rain: 70,
    humidity: 91,
    bgUrl: 'assets/rainy.jpg'
  ),
];