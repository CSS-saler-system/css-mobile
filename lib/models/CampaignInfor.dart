import 'package:flutter/material.dart';

class CampaignInfor {
  String image;
  CampaignInfor(this.image);
}

List<CampaignInfor> listCampaign =
    listData.map((item) => CampaignInfor(item['image']!)).toList();

var listData = [
  {"image": "assets/images/cp1.PNG"},
  {"image": "assets/images/cp2.PNG"},
  {"image": "assets/images/cp3.PNG"},
];
