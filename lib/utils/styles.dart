import 'package:flutter/material.dart';

const loginHeaderStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.grey
);

const loginInputDecors = InputDecoration(
  enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black87)
  ),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 2.0)
  ),
);

const locationInputDecors = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.black87)
  ),
  focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black87)
  )
);

const referralCodeStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black
);

const locationHeaderStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20.0
);

const locationTextBodyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 18.0
);

const allowBtnTextStyle = TextStyle(
    color: Colors.grey
);

const appBarTitleStyle = TextStyle(
    color: Color(0xFF2f2f2f),
  fontSize: 18.0,
  fontWeight: FontWeight.bold
);