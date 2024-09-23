import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp/utils/api_constants.dart';

import '../../utils/network_helper.dart';
import '../model/weather_api_response_model.dart';

class WeatherUpdateController extends GetxController {
  RxString lat = ''.obs;
  RxString long = ''.obs;

  var apiService =  NetworkHelper();

  var data = WeatherApiResponseModel().obs;

  getCurrentWeather() async{
   var key = "key=7ededc1e89e54ccfb9484611240507";
   var q = "q=${lat.value},${long.value}";
   print("My Current Lat long: $lat, $long");
    var response = await apiService.getApi('${ApiConstants.forecast}?$key&$q');
    print("Response --> ${jsonDecode(response)}");
    data.value = WeatherApiResponseModel.fromJson(jsonDecode(response) );
    print("Check Data Value: ${data.value.current.toString()}");

  }

  onInit() {
    getCurrentLocation();
  }

  Future<bool> handleLocationPermission( ) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Update', 'Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Update', 'Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Alert', 'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }

  getCurrentLocation() async {
    final permissionGranted = handleLocationPermission();
    if (await permissionGranted == false) {
      return;
    } else {
      await Geolocator.getCurrentPosition().then((Position position) {
        lat.value = position.latitude.toString();
        long.value = position.longitude.toString();
        print("Position: ${position.latitude}");
      });
    }
  }
}
