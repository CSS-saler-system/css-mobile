import 'dart:ui';

import 'package:bee/constants.dart';
import 'package:bee/screens/profile/components/profile_pic.dart';
import 'package:bee/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(20)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                ProfilePic(),
                SizedBox(height: getProportionateScreenWidth(20)),
                ProfileForm(),
              ],
            ),
          )),
    );
  }
}

class ProfileForm extends StatefulWidget {
  ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Full name",
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Date of birth",
              hintText: "Enter your DOB",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Phone number",
              hintText: "Enter your phone",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Address",
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          TextFormField(
            decoration: InputDecoration(
              labelText: "ID Card",
              hintText: "Enter your id card",
              floatingLabelBehavior: FloatingLabelBehavior.always,
            ),
          ),
        ],
      ),
    );
  }
}
