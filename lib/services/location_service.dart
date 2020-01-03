import 'dart:async';

import 'package:location/location.dart';
import 'package:my_eme/models/user_location.dart';

class LocationService {

  UserLocation _currLocation;
  var hasPermission;
  var location = Location();
  var hasLocationService;

  StreamController<UserLocation> locationController =
      StreamController<UserLocation>();

  Stream<UserLocation> get locationStream => locationController.stream;

  LocationService() {
    Future.delayed(Duration.zero, ()async{
      await this.checkPermissions();
      await this.getLocation();
    });
  }

  Future<bool> checkPermissions() async {
    hasPermission = await Location().hasPermission();
//    print('permission status:\t$hasPermission');
    hasLocationService = await location.serviceEnabled();
//    print('service status:\t$hasLocationService');
    if (hasPermission == true && hasLocationService == false) {
      await location.requestService();
    } else {
      getLocation();
    }
    return hasPermission;
  }

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currLocation =
          UserLocation(lon: userLocation.longitude, lat: userLocation.latitude);
      if (hasPermission && hasLocationService) {
        location.onLocationChanged().listen((locationData) {
          if (locationData != null) {
            locationController.add(UserLocation(
                lat: locationData.latitude, lon: locationData.longitude));
          }
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
