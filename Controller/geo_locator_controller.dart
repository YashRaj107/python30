import 'dart:async';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class GeoLocatorController extends GetxController {
  RxDouble longitude = 0.0.obs;
  RxDouble latitude = 0.0.obs;
  RxString address = ''.obs;
  RxString name = ''.obs;
  RxString locality = ''.obs;
  RxString country = ''.obs;
  RxString administrativeArea = ''.obs;
  RxString subAdministrativeArea = ''.obs;
  RxString thoroughfare = ''.obs;
  RxString subLocality = ''.obs;
  RxString street = ''.obs;


  StreamSubscription<Position>? streamSubscription;

  @override
  void onInit() async {
    super.onInit();
    getLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) async {
      latitude.value = position.latitude;
      longitude.value = position.longitude;
      getAddressFromLatLang(position);
    });
  }


Future<void> getAddressFromLatLang(Position position) async {
  List<Placemark> placemark = await placemarkFromCoordinates(
      position.latitude, position.longitude);
  Placemark place = placemark[0];
  locality.value = '${place.locality}';
  administrativeArea.value = '${place.administrativeArea}';
  country.value = '${place.country}';
  street.value = '${place.street}';
  subAdministrativeArea.value = '${place.subAdministrativeArea}';
  subLocality.value = '${place.subLocality}';
  thoroughfare.value = '${place.thoroughfare}';
  name.value = '${place.name}';
  print(place);
  }
}
