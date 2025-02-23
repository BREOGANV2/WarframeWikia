import 'package:app_warframe_api/core/model/model_status_cambion_drift.dart';
import 'package:app_warframe_api/core/model/model_status_cetus.dart';
import 'package:app_warframe_api/core/model/model_status_fortuna.dart';
import 'package:app_warframe_api/core/widget/Drawer_inicio.dart';
import 'package:app_warframe_api/provider/provider_warframe_api.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:slide_countdown/slide_countdown.dart';

class ChooserPlanetasScreen extends StatefulWidget {
  const ChooserPlanetasScreen({super.key});

  @override
  _ChooserPlanetasScreenState createState() => _ChooserPlanetasScreenState();
}

class _ChooserPlanetasScreenState extends State<ChooserPlanetasScreen> {
  String _selectedText = '';
  int _selectedIndex = -1;
  Future<dynamic>? _futureData;

  final List<Map<String, String>> _images = [
    {'path': 'asset/images/cetus.jpg', 'text': 'Cetus'},
    {'path': 'asset/images/deimos.jpg', 'text': 'Deimos'},
    {'path': 'asset/images/fortuna.jpg', 'text': 'Fortuna'},
  ];

  void _fetchData(String zone, ProviderWarframeApi providerApi) {
    setState(() {
      if (zone == 'Cetus') {
        _futureData = providerApi.StatusCetus();
      } else if (zone == 'Deimos') {
        _futureData = providerApi.StatusDeimos();
      } else {
        _futureData = providerApi.StatusFortuna();
      }
      _selectedText = zone;
    });
  }

  
  Duration _parseTimeString(String time) {
    final regex = RegExp(r'(\d+)m (\d+)s'); 
    final match = regex.firstMatch(time);

    if (match != null) {
      final minutes = int.parse(match.group(1)!); 
      final seconds = int.parse(match.group(2)!); 
      return Duration(minutes: minutes, seconds: seconds); 
    }

    return Duration.zero; 
  }

  @override
  Widget build(BuildContext context) {
    ProviderWarframeApi providerApi =
        Provider.of<ProviderWarframeApi>(context, listen: true);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("asset/images/destiny.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Image Carousel'),
        ),
        body: Column(
          children: [
            
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(top: 50,bottom: 50),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromARGB(73, 0, 0, 0),
                border: Border.all(
                  color: _selectedIndex == -1
                      ? Colors.transparent
                      : const Color.fromARGB(0, 138, 108, 177),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    _selectedText,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  if (_futureData != null)
                    FutureBuilder<dynamic>(
                      future: _futureData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (snapshot.hasData) {
                          if (_selectedText == 'Cetus') {
                            ModelStatusCetus data = snapshot.data;
                            final timeLeft = _parseTimeString(data.timeLeft!);
                            return Column(
                              children: [
                                Text(
                                  "Estado: ${data.state}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                SlideCountdownSeparated(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(66, 0, 0, 0)),
                                  separator: ':',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  duration: timeLeft,
                                  onDone: () {
                                    _fetchData(_selectedText, providerApi);
                                  },
                                ),
                              ],
                            );
                          } else if (_selectedText == 'Deimos') {
                            ModelStatusDeimos data = snapshot.data;
                            final timeLeft = _parseTimeString(data.timeLeft);
                            return Column(
                              children: [
                                Text(
                                  "Estado: ${data.state}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                SlideCountdownSeparated(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(66, 0, 0, 0)),
                                  separator: ':',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor:
                                          Color.fromARGB(0, 255, 193, 7)),
                                  duration: timeLeft,
                                  onDone: () {
                                    _fetchData(_selectedText, providerApi);
                                  },
                                )
                              ],
                            );
                          }else if(_selectedText=='Fortuna'){
                            ModelFortunaStatus data = snapshot.data;
                            final timeLeft = _parseTimeString(data.timeLeft!);
                            return Column(
                              children: [
                                Text(
                                  "Estado: ${data.isWarm! ? "Calido" :"Frio"}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                SlideCountdownSeparated(
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(66, 0, 0, 0)),
                                  separator: ':',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      backgroundColor:
                                          Color.fromARGB(0, 255, 193, 7)),
                                  duration: timeLeft,
                                  onDone: () {
                                    _fetchData(_selectedText, providerApi);
                                  },
                                )
                              ],
                            );
                          }
                        }
                        return const SizedBox();
                      },
                    ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: CarouselSlider.builder(
                  itemCount: _images.length,
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        _fetchData(_images[index]['text']!, providerApi);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _selectedIndex == index
                                ? Colors.blue
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            _images[index]['path']!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
