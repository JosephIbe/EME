import 'package:flutter/material.dart';
import 'package:my_eme/models/user_location.dart';
import 'package:my_eme/screens/home.dart';
import 'package:my_eme/services/location_service.dart';
import 'package:my_eme/services/network_service.dart';
import 'package:my_eme/utils/network_status.dart';
import 'package:my_eme/utils/router.dart';
import 'package:provider/provider.dart';

import 'intro/intro.dart';

void main() => runApp(MyEme());

class MyEme extends StatelessWidget {
  // This widget is the root of your application.

  var isFirstLaunch = true;

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        StreamProvider<ConnectivityStatus>.value(stream: ConnectivityService().connectionStreamController.stream),
        StreamProvider<UserLocation>.value(stream: LocationService().locationController.stream)
      ],
      child: MaterialApp(
        title: 'EME Water App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.generateRoute,
//      home: isFirstLaunch ? Intro() : Home(),
        home: Home(),
      ),
    );

  }
}