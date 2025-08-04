import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/weather_locations.dart';
import '../widgets/single_weather.dart';
import '../widgets/slider_dot.dart';
import '../widgets/search.dart';

class WeatherApp extends StatefulWidget {
  final bool isDarkTheme;
  final VoidCallback toggleTheme;

  const WeatherApp({
    Key? key,
    required this.isDarkTheme,
    required this.toggleTheme,
  }) : super(key: key);

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.8);

  String _getBackgroundImage(String weatherType) {
    switch (weatherType) {
      case 'Cerah':
        return 'assets/sunny.jpg';
      case 'Malam':
        return 'assets/night.jpg';
      case 'Hujan':
        return 'assets/rainy.jpg';
      case 'Berawan':
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
        title: const Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          onPressed: () async {
            final result = await showSearch(
              context: context,
              delegate: Search(),
            );
            if (result != null) {
              final index = locationList.indexWhere(
                (loc) => loc.city == result,
              );
              if (index != -1) {
                setState(() {
                  _currentPage = index;
                  _pageController.jumpToPage(index);
                });
              }
            }
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkTheme ? Icons.light_mode : Icons.dark_mode,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: widget.toggleTheme,
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
            height: double.infinity,
            width: double.infinity,
            color: widget.isDarkTheme
                ? const Color.fromARGB(128, 0, 0, 0)
                : const Color.fromARGB(128, 180, 180, 180),
          ),
          Column(
            children: [
              const SizedBox(height: 140),
              Container(
                margin: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(locationList.length, (i) {
                    return SliderDot(i == _currentPage);
                  }),
                ),
              ),
              const SizedBox(height: 20),
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
