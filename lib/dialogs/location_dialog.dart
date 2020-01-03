import 'package:flutter/material.dart';
import 'package:my_eme/models/user_location.dart';
import 'package:my_eme/services/location_service.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:my_eme/utils/styles.dart';
import 'package:provider/provider.dart';

class LocationDialog extends StatefulWidget {
  @override
  _LocationDialogState createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  @override
  Widget build(BuildContext context) {
    var mLocation = Provider.of<UserLocation>(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Image.asset('assets/images/perm_icon_location.png'),
          Text(
            locationDialogHeader,
            style: locationHeaderStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              locationDialogBody,
              textAlign: TextAlign.center,
              style: locationTextBodyStyle,
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.black,
                  onPressed: () async {
                    var isGranted = await LocationService().checkPermissions();
                    if (isGranted) {
                      print('isgranted $isGranted');
                      Navigator.pushReplacementNamed(context, homeRoute);
                      print('lat is${mLocation.lat} & lon is ${mLocation.lon}');
                    }
                  },
//                      onPressed: requestPerms,
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: Text(
                    allow,
                    style: allowBtnTextStyle,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
