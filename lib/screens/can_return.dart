import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:my_eme/models/user_location.dart';
import 'package:provider/provider.dart';

class CanReturn extends StatefulWidget {
  final String title;

  CanReturn({this.title});

  @override
  _CanReturnState createState() => _CanReturnState();
}

class _CanReturnState extends State<CanReturn> {
  final int canCount = 0;
  List<String> jarTypes = ['Normal Jar', 'Cool Jar'];

  Future address;

//  List<DropdownMenuItem<String>> _menuJarItems;

  @override
  Widget build(BuildContext context) {
    var location = Provider.of<UserLocation>(context);
    if (location != null) {
      final coords = Coordinates(location.lat, location.lon);
      setState(() {
        address = Geocoder.local.findAddressesFromCoordinates(coords);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          margin: EdgeInsets.all(6.0),
          child: Column(
            children: <Widget>[
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Request for return can',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4c4c4c),
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('Add Watercans Dropdown later'),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text('Number of water cans return'),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.5))),
                                height: 23.5,
                                width: 25.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '$canCount',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12.5))),
                                height: 23.5,
                                width: 25.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Container(
                width: double.infinity,
                child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Choose your brand',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4c4c4c),
                                  fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text('Add Brands Dropdown later'),
                            SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ))),
              ),
              SizedBox(height: 5.0,),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Reason for returning can',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4c4c4c),
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:
                              'Please give some reason for returning the can',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[800],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Address', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4c4c4c),
                              fontSize: 18.0),)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 0, right: 0, top: 5.0, bottom: 15.0),
                        child: Text(
                          '$address',
                          maxLines: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5.0,),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.grey[800],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('Landmark', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4c4c4c),
                              fontSize: 18.0),)
                        ],
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Landmark',
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.transparent,
                          )),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 48.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0))
                        ),
                        child: RaisedButton(
                          color: Colors.black,
                          onPressed: (){},
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
