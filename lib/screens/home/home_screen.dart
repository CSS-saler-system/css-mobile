import 'package:bee/components/custom_bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import 'components/body.dart';

// class HomeScreen extends StatelessWidget {
//   static String routeName = "/home";
//   int index = 2;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Body(),
//       bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;

    // late String token;
    // user!.getIdToken().then((result) {
    //   token = result.toString();
    //   while (token.length > 0) {
    //     int initLength = (token.length >= 500 ? 500 : token.length);
    //     print(token.substring(0, initLength));
    //     int endLength = token.length;
    //     token = token.substring(initLength, endLength);
    //   }
    // });
    // print('$token');
    return Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
