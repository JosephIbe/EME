import 'package:flutter/material.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:my_eme/utils/styles.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool showRefCode = false;

  void toggleRefStatus() {
    setState(() {
      showRefCode = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xFFfafafa),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 45.0,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          Text(loginHeader,
                              style: loginHeaderStyle, textAlign: TextAlign.center)
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Form(
                          key: formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                decoration: loginInputDecors.copyWith(
                                    hintText: 'Your Name'),
                                keyboardType: TextInputType.text,
                                controller: controller,
                              ),
                              TextFormField(
                                decoration: loginInputDecors.copyWith(
                                    hintText: 'Your Number'),
                                keyboardType: TextInputType.phone,
                                controller: controller,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 35.0,
                      ),
                      showRefCode == false
                          ? GestureDetector(
                        onTap: toggleRefStatus,
                        child: Text(
                          referralCodePrompt,
                          style: referralCodeStyle,
                        ),
                      )
                          : Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                              Border.all(color: Colors.black, width: 2.0)),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: referralCode,
                              fillColor: Colors.black12,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              border: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.transparent)),
                            ),
                          )
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      RaisedButton(
                          color: Colors.black87,
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 35.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Text(getOTP),
                          onPressed: () {
                            Navigator.pushNamed(context, otpRoute);
                          })
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
