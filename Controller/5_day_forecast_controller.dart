import 'dart:async';
import 'package:geo_locator/Controller/geo_locator_controller.dart';
import 'package:geo_locator/http_request_helper.dart';
import 'package:get/get.dart';

const dailyWeatherApiUrl = 'https://api.openweathermap.org/data/2.5/forecast';

class DailyWeather extends GetxController {
  StreamSubscription<DailyWeather>? streamSubscription;

  RxList Daily = [].obs;
  RxString weatherDescription = ''.obs;
  RxDouble temperature = 0.0.obs;
  RxInt hour = 00.obs;
  RxInt minute = 00.obs;
  RxString icon = ''.obs;

  final GeoLocatorController _locationCont = Get.put(GeoLocatorController());

  @override
  void onInit() async {
    super.onInit();
    _locationCont.getLocation();
    getLocationWeather(
        _locationCont.latitude.value, _locationCont.longitude.value);
  }

  @override
  void onClose() async {
    _locationCont.streamSubscription!.cancel();
  }

  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=57e86784b4091f4a78913f26ce877718&units=metric');
    var DailyData = await networkHelper.getData();
    print('Daily Data: $DailyData');

    for (int i = 0; i < 39; i++) {
      hour.value =
          DateTime.fromMillisecondsSinceEpoch(DailyData["list"][i]["dt"] * 1000)
              .hour;
      minute.value =
          DateTime.fromMillisecondsSinceEpoch(DailyData["list"][i]["dt"] * 1000)
              .minute;
      icon.value = DailyData["list"][i]['weather'][0]['icon'];
      temperature.value = DailyData['list'][i]['main']['temp'] + 0.0;
      weatherDescription.value =
          DailyData['list'][i]['weather'][0]['description'];
      Daily.value.add([
        hour.value,
        minute.value,
        icon.value,
        temperature.value,
        weatherDescription.value
      ]);
    }
    print(Daily.value);
  }
}
