import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:my_eme/models/user_location.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:my_eme/utils/network_status.dart';
import 'package:my_eme/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  GoogleMapController _controller;
  var apiKey = 'AIzaSyBw5UruQ8LmQ9Zkw57eLpOvwKGu9bMFNHk';
  Set<Marker> _markers = Set<Marker>();
  BitmapDescriptor mPositionMarker;

  Prediction prediction;
  List<PlacesSearchResult> placesResultsList = [];
  GoogleMapsPlaces _places =
      GoogleMapsPlaces(apiKey: 'AIzaSyBw5UruQ8LmQ9Zkw57eLpOvwKGu9bMFNHk');
  var address;

  @override
  Widget build(BuildContext context) {
    var connected = Provider.of<ConnectivityStatus>(context);
//    var mLocation = Provider.of<UserLocation>(context);
    debugPrint('Network Connection Status:\t$connected');

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF5b5b5b),
      drawer: buildDrawer(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            buildMap(),
            Container(
              height: 55.0,
              width: double.infinity,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.brown[300],
                      ),
                      onPressed: openDrawer),
                  Text(
                    appBarTitle,
                    style: appBarTitleStyle,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.brown[300],
                      ),
                      onPressed: openPlacesSearch)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            child: Container(
          height: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  height: 50,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Your Name',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0,),
                Text(
                  'Your Number',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(regularOH),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, regularOHRoute, arguments: 'Regular Orders');
          },
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text(occasionalOH),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, occasionalOHRoute, arguments: 'Occasional Orders');
          },
        ),
        ListTile(
          leading: Icon(Icons.credit_card),
          title: Text(myCard),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, myCardRoute, arguments: 'My Card');
          },
        ),
        ListTile(
          leading: Icon(Icons.swap_horiz),
          title: Text(canReturn),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, canReturnRoute);
          },
        ),
        Divider(),
        Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Text(emeSpecial)),
        ListTile(
          leading: Icon(Icons.group_add),
          title: Text(joinEME),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, serviceComingRoute,
                arguments: 'EME Prime');
          },
        ),
        ListTile(
          leading: Icon(Icons.call_to_action),
          title: Text(referAndEarn),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, serviceComingRoute,
                arguments: 'Refer & Earn');
          },
        ),
        ListTile(
          leading: Icon(Icons.attach_money),
          title: Text(myEarnings),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, serviceComingRoute,
                arguments: 'My Earnings');
          },
        ),
        Divider(),
        Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            child: Text(communicate)),
        ListTile(
          leading: Icon(Icons.share),
          title: Text(share),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.phone),
          title: Text(contact),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, contactUsRoute);
          },
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text(tnc),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(Icons.eject),
          title: Text(logOut),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, logOutRoute);
          },
        ),
      ],
    ));
  }

  void openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void openPlacesSearch() async {
    prediction = await PlacesAutocomplete.show(
        context: context,
        apiKey: apiKey,
        mode: Mode.overlay,
        language: 'en',
        onError: onSearchError,
        components: [Component(Component.country, 'in')]);

    if (prediction != null) {
      var placeId = prediction.placeId;
      PlacesDetailsResponse detailsResponse =
          await _places.getDetailsByPlaceId(placeId);

      double lat = detailsResponse.result.geometry.location.lat;
      double lon = detailsResponse.result.geometry.location.lng;

      address =
          await Geocoder.local.findAddressesFromQuery(prediction.description);
      print('queried address $address');

      print('latitude of place is $lat');
      print('longitude of place is $lon');

      _controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lon))));
    }
  }

  void onSearchError(PlacesAutocompleteResponse response) {
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(response.errorMessage)));
  }

  Widget buildMap() {
    var mLocation = Provider.of<UserLocation>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.75,
            child: GoogleMap(
                  onMapCreated: OnMapCreated,
//              initialCameraPosition: CameraPosition(target: LatLng(20.2961, 85.8245),zoom: 14.0),
              initialCameraPosition: CameraPosition(target:
                    LatLng(mLocation.lat, mLocation.lon),zoom: 16.0),
              markers: _markers,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
                ),
          ),
          buildDeliveryAddress()
        ],
      ),
    );
  }

  void OnMapCreated(GoogleMapController controller) async {
    var mLocation = Provider.of<UserLocation>(context);
    setState(() {
      _controller = controller;
    });

    mPositionMarker = await BitmapDescriptor
        .fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5), 'assets/images/location_marker.png');

    var markerPosition;
    if(mLocation != null){
      markerPosition = LatLng(mLocation.lat, mLocation.lon);
    } else{
      markerPosition = LatLng(20.82, 85.96);
    }
    _markers.add(Marker(
        markerId: MarkerId('initialPosition'),
        position: markerPosition,
        icon: mPositionMarker)
    );
  }

  Widget buildDeliveryAddress(){
    var mLocation = Provider.of<UserLocation>(context);
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFededed),
            padding: EdgeInsets.all(6.0),
            child: Text(
              'DELIVERY LOCATION',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF656565),
                  fontWeight: FontWeight.w900,
                  fontSize: 14.0
              ),
            ),
          ),
          Container(
            color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('YOUR LOCATION',
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.check_circle, color: Colors.green,),
                      Expanded(
                          child:
                          Text('Lane number 5B, Bapuji Nagar, Kanan Vihar, Chandrasekhapur, Bhubaneswar, Odisha 751017, India',
                            style: TextStyle(fontSize: 13.0),
                          )
                      )
                    ],
                  ),
                  Text('COMPLETE ADDRESS (Mandatory)',
                    style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  TextFormField(
                    decoration: locationInputDecors.copyWith(hintText: houseHint),
                  ),
                  TextFormField(
                    decoration: locationInputDecors.copyWith(hintText: emailHint),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.black87,
                    margin: EdgeInsets.only(top: 8.0),
                    child: RaisedButton(
                      onPressed: null,
                      child: Text('CONFIRM LOCATION',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
          )
        ],
      ),
    );
  }

}
