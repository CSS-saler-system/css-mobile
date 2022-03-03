import 'package:bee/screens/account/account_screen.dart';
import 'package:bee/screens/bag/bag_screen.dart';
import 'package:bee/screens/details/details_screen.dart';
import 'package:bee/screens/home/home_screen.dart';
import 'package:bee/screens/login/login_screen.dart';
import 'package:bee/screens/otp/otp_screen.dart';
import 'package:bee/screens/plash/plash_screen.dart';
import 'package:bee/screens/profile/profile_screen.dart';
import 'package:bee/screens/request_sell/request_sell_product.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  BagScreen.routeName: (context) => BagScreen(),
  RequestScreen.routeName: (context) => RequestScreen(),
  AccountScreen.routeName: (context) => AccountScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
};
