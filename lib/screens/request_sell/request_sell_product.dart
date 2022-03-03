import 'package:bee/components/custom_bottom_nav.dart';
import 'package:bee/enums.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatelessWidget {
  static String routeName = "/request";

  const RequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hihi"),
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.request),
    );
  }
}
