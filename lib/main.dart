import 'package:flutter/material.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = '';
  List<String> _forecast = [];

  void _getWeather() {
    setState(() {
      _weatherInfo = 'Sunny, 25°C'; // Simulated data
    });
  }

  void _get7DayForecast() {
    setState(() {
      _forecast = [
        'Day 1: Sunny, 25°C',
        'Day 2: Cloudy, 22°C',
        'Day 3: Rainy, 20°C',
        'Day 4: Sunny, 24°C',
        'Day 5: Thunderstorms, 18°C',
        'Day 6: Partly Cloudy, 21°C',
        'Day 7: Sunny, 26°C',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getWeather,
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16.0),
            Text(
              _weatherInfo,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _get7DayForecast,
              child: Text('Get 7-Day Forecast'),
            ),
            SizedBox(height: 16.0),
            ..._forecast.map((day) => Text(day)).toList(),
          ],
        ),
      ),
    );
  }
}