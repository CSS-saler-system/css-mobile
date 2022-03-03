import 'package:bee/components/default_button.dart';
import 'package:bee/screens/otp/otp_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../size_config.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String dialCodeDigits = "+00";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Image.asset(
                "assets/images/login.PNG",
                height: getProportionateScreenHeight(265),
                width: getProportionateScreenWidth(235),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            SizedBox(
              width: 400,
              height: 60,
              child: CountryCodePicker(
                onChanged: (country) {
                  setState(() {
                    dialCodeDigits = country.dialCode!;
                  });
                },
                initialSelection: "IT",
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: ["+84", "VN", "+1", "US"],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
                right: 10,
                left: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone number",
                    prefix: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                      ),
                      child: Text(dialCodeDigits),
                    )),
                maxLength: 11,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              width: double.infinity,
              child: DefaultButton(
                text: "Next",
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (c) => OTPScreen(
                          phone: _controller.text,
                          codeDigits: dialCodeDigits)));
                },
                // child: Text(
                //   "Next",
                //   style: TextStyle(
                //     fontSize: getProportionateScreenWidth(20),
                //     color: kPrimaryColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
