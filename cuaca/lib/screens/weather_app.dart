import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/weather_locations.dart';
import '../widgets/single_weather.dart';
import '../widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);
  bool isDarkTheme = true;

  String _getBackgroundImage(String weatherType) {
    switch (weatherType) {
      case 'Sunny':
        return 'assets/sunny.jpg';
      case 'Night':
        return 'assets/night.jpg';
      case 'Rainy':
        return 'assets/rainy.jpg';
      case 'Cloudy':
        return 'assets/cloudy.jpeg';
      default:
        return 'assets/sunny.jpg';
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String bgImg = _getBackgroundImage(
      locationList[_currentPage].weatherType,
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, size: 30, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkTheme ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                isDarkTheme = !isDarkTheme;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () => print('Menu Clicked!'),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            bgImg,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            color: isDarkTheme ? Colors.black38 : Colors.white.withOpacity(0.5),
          ),
          Column(
            children: [
              SizedBox(height: 140),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(locationList.length, (i) {
                    return SliderDot(i == _currentPage);
                  }),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: locationList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final bool isActive = index == _currentPage;
                    final double scale = isActive ? 1.0 : 0.85;
                    final double opacity = isActive ? 1.0 : 0.5;

                    return AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: opacity,
                      child: Transform.scale(
                        scale: scale,
                        child: SingleWeather(index),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
