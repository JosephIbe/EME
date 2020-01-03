import 'package:flutter/material.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:my_eme/utils/styles.dart';

class ValidateOTP extends StatefulWidget {
  @override
  _ValidateOTPState createState() => _ValidateOTPState();
}

class _ValidateOTPState extends State<ValidateOTP> {

  bool isSubmitting = false;

  Future<bool> validateOTP() async {
    setState(() {
      isSubmitting = !isSubmitting;
    });
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isSubmitting = !isSubmitting;
      });
      Navigator.pushNamed(
          context, locationDialogRoute
      );
    });
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> Future.value(true),
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: loginInputDecors.copyWith(hintText: otpHint),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                    color: Colors.black87,
                    textColor: Colors.white,
                    padding:
                    EdgeInsets.symmetric(vertical: 15.0, horizontal: 35.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Text(signIn),
                    onPressed: isSubmitting ? null : validateOTP
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(detectOTP),
                SizedBox(
                  height: 15.0,
                ),
                Text(dummyTimer),
                SizedBox(height: 20.0,),
                isSubmitting ? CircularProgressIndicator(
                  backgroundColor: Colors.black,) : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
