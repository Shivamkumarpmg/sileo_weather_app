import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Modules/controllers/weather_update_controller.dart';
import 'package:weatherapp/Modules/presentation/weather_forcast_list_screen.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  var lat = '';
  var long = '';

  WeatherUpdateController controller = Get.put(WeatherUpdateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location: ${controller.data.value.location?.name ?? ''}'),
                const SizedBox(height: 6),
                Text(
                    'Temperature(C): ${controller.data.value.current?.tempC ?? ''}'),
                const SizedBox(height: 6),
                Text(
                    'Weather Condition : ${controller.data.value.forecast?.forecastday![0].day?.condition?.text ?? ''}'),
                const SizedBox(height: 6),
              ElevatedButton(onPressed: (){
                Get.to(()=> WeatherForcastListScreen());
              }, child: Text('Next')),

              ]),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getCurrentWeather();
        },
        child: const Icon(Icons.location_on_outlined),
      ),
    );
  }
}
