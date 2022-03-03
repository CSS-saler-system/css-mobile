import 'package:bee/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFFD700);
const kPrimaryLightColor = Color(0xFFFFFCDD);

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797); //0xFF979797
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const defaultDuration = Duration(milliseconds: 250);

class Constants {
  static const String REGEX_PHONE_NUMBER =
      '^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*\$';

  static const int MY_MAIN_SCREEN_ID = 0;
  static const int MY_DASH_BOARD_ID = 1;
  static const int MY_CATEGORY_SCREEN_ID = 2;

  ///Firestore
  static const String USER_COLLECTION = 'USERS';
  static const String CATEGORY = 'CATEGORY';
  static const String NOTES = 'NOTES';

  ///Params
  static const String PHONE_NUMBER = 'PHONE';
}
