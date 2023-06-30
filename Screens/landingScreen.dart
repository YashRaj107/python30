import 'package:flutter/material.dart';
import 'package:geo_locator/Controller/5_day_forecast_controller.dart';
import 'package:geo_locator/Controller/Weather_Model.dart';
import 'package:geo_locator/Controller/air_quality_controller.dart';
import 'package:geo_locator/Controller/geo_locator_controller.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gauges/gauges.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  WeatherModel _weatherCont = Get.put(WeatherModel());
  GeoLocatorController _geoLocatorCont = Get.put(GeoLocatorController());
  AirQuality _qualityCont = Get.put(AirQuality());
  DailyWeather _dayForecast = Get.put(DailyWeather());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/weathersunny.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.barsStaggered,
                            color: Colors.white54,
                          ),
                        ),
                        Obx(
                          () => Text(
                            '${_geoLocatorCont.locality.value}',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.list,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Obx(
                            () => Text(
                              'RealFeel® ${_weatherCont.feels_like.value}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Obx(
                            () => Text(
                              '${_weatherCont.temperature.value.round()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.circleArrowUp,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Obx(
                                  () => Text(
                                    '${_weatherCont.temp_max.value}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.circleArrowDown,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Obx(
                                  () => Text(
                                    '${_weatherCont.temp_min.value.round()}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(() =>
                              Text('Latitudes - ${_geoLocatorCont.latitude.value}')
                          ),
                          Obx(() =>
                              Text('Longitudes - ${_geoLocatorCont.longitude.value}')
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue[200]?.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.air_rounded),
                                      Text('AIR QUALITY'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() => Text(
                                          'AQI - ${_qualityCont.aqi.value.round()}')),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                            child: Icon(Icons.info_outline)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text('NO2'),
                                          Obx(() => Text(
                                              '${_qualityCont.no2.value.round()}')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('O3'),
                                          Obx(() => Text(
                                              '${_qualityCont.o3.value.round()}')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('PM10'),
                                          Obx(() => Text(
                                              '${_qualityCont.pm10.value.round()}')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('PM2_5'),
                                          Obx(() => Text(
                                              '${_qualityCont.pm2_5.value.round()}')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('CO'),
                                          Obx(() => Text(
                                              '${_qualityCont.co.value.round()}')),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text('SO2'),
                                          Obx(() => Text(
                                              '${_qualityCont.so2.value.round()}')),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.blue[200]?.withOpacity(.2),
                            margin: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.wind),
                                    Text('PRESSURE'),
                                  ],
                                ),
                                Obx(() => Text('${_weatherCont.pressure.value}')),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.blue[200]?.withOpacity(.2),
                            margin: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.wind),
                                    Text('WIND'),
                                  ],
                                ),
                                Obx(() => Text('${_weatherCont.windspeed.value}')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: Colors.blue[200]?.withOpacity(.2),
                            margin: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.eye),
                                    Text('VISIBILITY'),
                                  ],
                                ),
                                Obx(() => Text('${_weatherCont.visibility.toInt()}')),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.blue[200]?.withOpacity(.2),
                            margin: EdgeInsets.all(3),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.glassWaterDroplet),
                                      Text('HUMIDITY'),
                                    ],
                                  ),
                                  Obx(() => Text('${_weatherCont.humidity.value}')),
                                ]),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 188,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 39,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(()=>TwentyFourHourForecast(
                                hour:"${ _dayForecast.Daily[index][0]}",
                                minute:"${ _dayForecast.Daily[index][1]}",
                                icon: ClipRect(
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    heightFactor: 0.5,

                                    child: Image.network(
                                      'http://openweathermap.org/img/w/'
                                          '${_dayForecast.Daily[index][2]}.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                temp:"${ _dayForecast.Daily[index][3]}",
                                description:"${ _dayForecast.Daily[index][4]}",
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TwentyFourHourForecast extends StatelessWidget {
  TwentyFourHourForecast(
      {Key? key,
      required this.hour,
      required this.minute,
      required this.icon,
      required this.temp,
      required this.description})
      : super(key: key);
  final String hour;
  final String minute;
  final icon;
  final String temp;
  final String description;

  @override
  Widget build(BuildContext context) {
    DailyWeather _dayForecast = Get.put(DailyWeather());
    return Card(
      elevation: 5,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(hour, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Text(':', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                Text(minute, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
              ],
            ),
            icon,
            Text(temp),
          ],
        ),
      ),
    );
  }
}
