
import 'package:geo_locator/Controller/geo_locator_controller.dart';
import 'package:http/http.dart';
import 'package:geo_locator/http_request_helper.dart';
import 'package:get/get.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel extends GetxController {
  RxString weatherMain = ''.obs;
  RxString weatherDescription = ''.obs;
  RxDouble temperature = 0.0.obs;
  RxDouble feels_like = 0.0.obs;
  RxInt humidity = 0.obs;
  RxDouble windspeed = 0.0.obs;
  RxDouble winddeg = 0.0.obs;
  RxDouble windgust = 0.0.obs;
  RxInt pressure = 0.obs;
  RxInt visibility = 0.obs;
  RxDouble temp_min = 0.0.obs;
  RxDouble temp_max = 0.0.obs;


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
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=57e86784b4091f4a78913f26ce877718&units=metric');
        var weatherData = await networkHelper.getData();
        print('Weather Data: $weatherData');
        
        weatherMain.value = weatherData['weather'][0]['main'];
        weatherDescription.value = weatherData['weather'][0]['description'];
        temperature.value = weatherData['main']['temp'];
        feels_like.value = weatherData['main']['feels_like'];
        humidity.value = weatherData['main']['humidity'];
        pressure.value = weatherData['main']['pressure'];
        windspeed.value = weatherData['wind']['speed'];
        winddeg.value = weatherData['wind']['deg'];
        windgust.value = weatherData['wind']['gust'];
        visibility.value = weatherData['visibility'];
        temp_min.value = weatherData['main']['temp_min'];
        temp_max.value = weatherData['main']['temp_max'];
        update();

  }
}
