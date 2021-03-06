import 'package:bee/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_btn_with_noti.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnNoti(
            svgSrc: "assets/icons/Cart Icon.svg",
            numberOfNoti: 0,
            press: () {},
          ),
          IconBtnNoti(
            svgSrc: "assets/icons/Bell.svg",
            numberOfNoti: 0,
            press: () {},
          ),
        ],
      ),
    );
  }
}
