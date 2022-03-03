import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final listData = [
    {'image': "assets/images/cp1.PNG"},
    {'image': "assets/images/cp1.PNG"},
    {'image': "assets/images/cp1.PNG"},
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CarouselSlider.builder(
        options: CarouselOptions(height: 400),
        itemCount: listData.length,
        itemBuilder: (context, index, realIndex) {
          final listD = listData[index]['image']!;
          return buildImage(listD.toString(), index);
        },
      ),
    );
  }
}

Widget buildImage(String listD, index) => Container();
