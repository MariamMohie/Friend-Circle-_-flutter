import 'dart:math';

import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
    return Scaffold(
backgroundColor: Kwhite,

body: Stack(
  alignment: Alignment.center,
  children: [
    Positioned(
      top: -50,

      child: Transform.rotate(
        angle: pi/4,
        child: Container(
        height: size.height * 0.60,
        width: size.height * 0.60,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0,color:K1LightGray!),
          borderRadius: BorderRadius.circular(152.0)
        ),
          ),
      ),
    ),
    Positioned(
      top: -90,
      child: Transform.rotate(angle: pi/4,
      child: Container(
        height: size.height * 0.60,
        width: size.height * 0.60,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0,color: K1LightGray!),
          borderRadius: BorderRadius.circular(152.0),
        ),
      ),
      ),
      ),
      Positioned(
        top: -130,
        child: Transform.rotate(angle: pi/4,
        child: Container(
          height: size.height* 0.60,
          width: size.height* 0.60,
          decoration: BoxDecoration(color: K2MainThemeColor,
          borderRadius: BorderRadius.circular(152.0)),
        ),)),
        child
    ],
),
    );
  }
}