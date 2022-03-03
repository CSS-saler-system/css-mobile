//import 'package:bee/models/CampaignInfor.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CampaignInformation extends StatefulWidget {
  const CampaignInformation({
    Key? key,
  }) : super(key: key);

  @override
  State<CampaignInformation> createState() => _CampaignInformationState();
}

class _CampaignInformationState extends State<CampaignInformation> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(getProportionateScreenWidth(20)),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            //   vertical: getProportionateScreenWidth(15),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CampaignCard(
                image: "assets/images/cp1.PNG",
                nameCampaign: "Summer Vibexxxx",
                startDate: "2021-02-01",
                endDate: "2021-02-28",
                press: () {},
              ),
              CampaignCard(
                image: "assets/images/cp3.PNG",
                nameCampaign: "Fall f*cking uuuuu",
                startDate: "2021-02-01",
                endDate: "2021-02-28",
                press: () {},
              ),
              CampaignCard(
                image: "assets/images/cp3.PNG",
                nameCampaign: "Otokeeeeeeeeeeeeee",
                startDate: "2021-02-01",
                endDate: "2021-02-28",
                press: () {},
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
// return InkWell(
//     borderRadius: BorderRadius.circular(50),
//     onTap: () {},
//     child: Container(
//       // height: 90,
//       width: double.infinity,
//       margin: EdgeInsets.all(getProportionateScreenWidth(20)),
//       padding: EdgeInsets.symmetric(
//         horizontal: getProportionateScreenWidth(20),
//         vertical: getProportionateScreenWidth(15),
//       ),

//           decoration: BoxDecoration(
//              color: Color(0xFFF5CA48),
//            // image: DecorationImage(
//             //     image: AssetImage('assets/images/Image Banner 2.png')),
//             borderRadius: BorderRadius.circular(20),
//           ),

//           child: Text.rich(
//             TextSpan(
//               style: TextStyle(color: Colors.white),
//               children: [
//                 TextSpan(text: "A Summer Surpise Campaign XXX\n"),
//                 TextSpan(text: "01/11/2022"),
//                 TextSpan(text: "-" + "02/11/2022\n"),
//                 TextSpan(
//                   text: "Discount 20%",
//                   style: TextStyle(
//                     fontSize: getProportionateScreenWidth(24),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ),
//     );

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    Key? key,
    required this.press,
    required this.nameCampaign,
    required this.image,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  final String nameCampaign, image;
  final String startDate, endDate;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(262),
          height: getProportionateScreenWidth(150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25.0),
                    vertical: getProportionateScreenWidth(40),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$nameCampaign\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$startDate + $endDate")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
