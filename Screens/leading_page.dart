import 'package:flutter/material.dart';
import 'package:geo_locator/Controller/Weather_Model.dart';
import 'package:geo_locator/Controller/geo_locator_controller.dart';
import 'package:get/get.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  WeatherModel _weatherCont = Get.put(WeatherModel());
  GeoLocatorController _geoLocatorCont = Get.put(GeoLocatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'The Weather App',
              textAlign: TextAlign.start,
            ),
            Icon(
              Icons.add,
            ),
          ],
        ),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.cyan,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                        size: 80,
                      ),
                      Obx(
                          ()=> Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Longitude=${_geoLocatorCont.longitude.value}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                              Text(
                                'Latitude${_geoLocatorCont.latitude.value}',
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  Obx(
                    ()=>Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${_weatherCont.temperature}',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        Icon(Icons.cloud_rounded, size: 100, color: Colors.white),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(
                            ()=> Text(
                          'Feels like: ${_weatherCont.feels_like}',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Updated: Sun 28 August,11:34AM',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                      child: Card(
                        color: Colors.cyan.shade400,
                        elevation: 1,
                        margin: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Humidity',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Obx(
                                  ()=> Text(
                                    '${_weatherCont.humidity.value}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.white70,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Icon(
                              Icons.cloud_sharp,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Clouds',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '90%',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.white70,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Visibility',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '10.00km',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
                      child: Card(
                        color: Colors.cyan.shade400,
                        elevation: 1,
                        margin: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.wind_power_sharp,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '11.16 km/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.near_me,
                                  color: Colors.white,
                                ),
                                Text(
                                  'NE',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.white70,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Icon(
                              Icons.speed_rounded,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '1024 hpa',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Load more...',
                    style: TextStyle(
                        color: Colors.white70, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.end,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 20, 8, 10),
                      child: Card(
                        color: Colors.cyan.shade400,
                        elevation: 1,
                        margin: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.cloud_rounded,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Indore',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '17° Broken Clouds',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.white70,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.water_drop_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '93%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cloud_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '75%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
                      child: Card(
                        color: Colors.cyan.shade400,
                        elevation: 1,
                        margin: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.cloud_rounded,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'London',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '17° Broken Clouds',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              thickness: 2,
                              color: Colors.white70,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.water_drop_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '72%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cloud_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '95%',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
