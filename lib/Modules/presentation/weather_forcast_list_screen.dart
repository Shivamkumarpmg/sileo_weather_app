import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:weatherapp/Modules/controllers/weather_update_controller.dart';

import '../../utils/custom_widget.dart';
import '../../utils/ver_list_tile.dart';

class WeatherForcastListScreen extends StatefulWidget {
  const WeatherForcastListScreen({super.key});

  @override
  State<WeatherForcastListScreen> createState() =>
      _WeatherForcastListScreenState();
}

class _WeatherForcastListScreenState extends State<WeatherForcastListScreen> {
  WeatherUpdateController controller = Get.put(WeatherUpdateController());

  List n = List.generate(20, (index) => index.toString());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(42, 108, 202, 1),));
    return Obx(() {
      return Scaffold(
          body: Container(
            height: double.infinity,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: h * 0.4,
                    // margin: EdgeInsets.only(top:10),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(42, 108, 202, 1),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50))),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.chevron_left, color: Colors.white,size: 40,),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 40,
                                  width: 200,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on_sharp,
                                        color: Colors.red,
                                      ),
                                      Text(
                                          '${controller.data.value.location?.name ?? ''}, India')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                         SizedBox(height: h * 0.1),
                        Text('${controller.data.value.current?.tempC.toInt() ?? ''}°C', style: TextStyle(fontSize: 60, color: Colors.white),),
                        Text('${controller.data.value.forecast?.forecastday![0].day?.condition?.text ?? ''} ${controller.data.value.forecast?.forecastday![0].day?.maxtempC.toInt() ?? ''}°C/${controller.data.value.forecast?.forecastday![0].day?.mintempC.toInt() ?? ''}°C', style: TextStyle(fontSize: 16, color: Colors.white),)
                      ],
                    ),

                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20, //controller.data.value.forecast?.forecastday!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (cont, index){
                      return CustomTile(
                        date: '${n[index]}:00',// ,
                        percent: '60',
                        temp: '32',
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(

                      shrinkWrap: true,
                        itemCount: 20, //controller.data.value.forecast?.forecastday!.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (cont, index){
                          return VerticalListTile(
                            date: '${n[index]}:00',// ,
                            percent: '60',
                            temp: '32',
                          );
                        }),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
