import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CurrentLocation extends StatefulWidget {
  const CurrentLocation({super.key});

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
        Text('My Current Location: ')
        ,),
      floatingActionButton: FloatingActionButton(onPressed: (){
        checkPermissionForLocation();
        getCurrentLocation();
      },
        child: Icon(Icons.location_on_outlined),
      ),
    );
  }
}


Future<Position> checkPermissionForLocation()async{


  Position permission = (await Geolocator.getCurrentPosition());

  print("Get Lattitude: ${permission.latitude}");
return await Geolocator.getCurrentPosition();
}


Future<bool> handleLocationPermission()async{
  bool isLocationEnabled = false;
  LocationPermission permission;

  isLocationEnabled = await Geolocator.isLocationServiceEnabled();
  if(isLocationEnabled){
    print("Location service is enabled: $isLocationEnabled");
    return true;
  }
  permission = await Geolocator.checkPermission();
  if(permission == LocationPermission.always){
    return true;
  }
  else {
    return false;
  }
}


getCurrentLocation() async{
final permissionGranted = handleLocationPermission();
if(await permissionGranted == false){
  return;
}else{
  await Geolocator.getCurrentPosition().then((Position position) {print("Position: ${position.latitude}");});
}
}