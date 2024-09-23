
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/Modules/model/weather_api_response_model.dart';
import 'package:weatherapp/utils/api_constants.dart';

class NetworkHelper{

Future<dynamic> getApi(String url)async{
  print("Url $url");
  var response = await http.get(Uri.parse(url));


  // var data = jsonDecode(response.body);
  // debugPrint("Data ${data.toString()}");
  print("Check Type: ${response.body.runtimeType}");
  return response.body;
}

}