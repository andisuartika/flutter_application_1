import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF0353A4);
const kPrimaryLightColor = Color(0xFF0466C8);

const kSecondaryColor = Color(0xFFC4C4C4);
const kSecondaryLightColor = Color(0xFFE5E5E5);
const kTextColor = Color(0xFF757575);

const kTextPrimaryColor = Color(0xFF212529);

const kDefaulPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 15),
  blurRadius: 27,
  color: Colors.black12, // Black color with 12% opacity
);

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter Your Email";
const String kNameNullError = "Please Enter Your Name";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter Your Password";
const String k2PassNullError = "Please Enter Confirm Password";
const String kMatchPassError = "Passwords don't match";
