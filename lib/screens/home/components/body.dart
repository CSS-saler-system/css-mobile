import 'package:bee/screens/home/components/home_header.dart';
import 'package:bee/screens/home/components/popular_product.dart';

import 'package:bee/size_config.dart';
import 'package:flutter/material.dart';

import 'banners.dart';
import 'campaign_infor.dart';
import 'categories.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Banners(),
            SizedBox(height: getProportionateScreenWidth(10)),
            // CampaignInformation(),
            //  Categories(),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
