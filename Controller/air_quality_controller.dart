
import 'package:geo_locator/Controller/geo_locator_controller.dart';
import 'package:http/http.dart';
import 'package:geo_locator/http_request_helper.dart';
import 'package:get/get.dart';

const weatherApiUrl = 'http://api.openweathermap.org/data/2.5/air_pollution';

class AirQuality extends GetxController {
  RxDouble aqi = 0.0.obs;
  RxDouble co = 0.0.obs;
  RxDouble no = 0.0.obs;
  RxDouble o3 = 0.0.obs;
  RxDouble no2 = 0.0.obs;
  RxDouble so2 = 0.0.obs;
  RxDouble pm2_5 = 0.0.obs;
  RxDouble pm10 = 0.0.obs;
  RxDouble nh3 = 0.0.obs;


  final GeoLocatorController _locationCont = Get.put(GeoLocatorController());

  @override
  void onInit() async {
    super.onInit();
    _locationCont.getLocation();
    getLocationWeather(_locationCont.latitude.value, _locationCont.longitude.value);
  }

  @override 
  void onClose() async {
    _locationCont.streamSubscription!.cancel();
  }

  Future<dynamic> getLocationWeather(double latitude, double longitude) async {
    NetworkData networkHelper = NetworkData(
        'http://api.openweathermap.org/data/2.5/air_pollution/forecast?lat=$latitude&lon=$longitude&appid=57e86784b4091f4a78913f26ce877718&units=metric');
    var QualityData = await networkHelper.getData();
    print('Quality Data: $QualityData');

    aqi.value = QualityData['list'][0]['main']['aqi']+0.0;
    co.value = QualityData['list'][0]['components']['co']+0.0;
    no.value = QualityData['list'][0]['components']['no']+0.0;
    no2.value = QualityData['list'][0]['components']['no2']+0.0;
    o3.value = QualityData['list'][0]['components']['o3']+0.0;
    so2.value = QualityData['list'][0]['components']['so2']+0.0;
    pm2_5.value = QualityData['list'][0]['components']['pm2_5']+0.0;
    pm10.value = QualityData['list'][0]['components']['pm10']+0.0;
    nh3.value = QualityData['list'][0]['components']['nh3']+0.0;
    update();

  }
}
