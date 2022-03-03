import 'package:bee/components/custom_bottom_nav.dart';
import 'package:bee/enums.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class BagScreen extends StatelessWidget {
  static String routeName = "/bag";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hihi"),
      ),
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.bag),
    );
  }
}
