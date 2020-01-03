import 'package:flutter/material.dart';
import 'package:my_eme/utils/constants.dart';

class ServiceComingSoon extends StatelessWidget {

  final String args;
  const ServiceComingSoon({Key key, this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('$args'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.help),
              SizedBox(height: 10.0,),
              Text(serviceSoon)
            ],
          ),
        ),
      ),
    );
  }
}
