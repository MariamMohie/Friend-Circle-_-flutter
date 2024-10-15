import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Backgound extends StatelessWidget {
  const Backgound({super.key,required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Kwhite,
    body: Stack(
      children: [
        Positioned(
          top: size.height*-0.3,
          left: size.height *-0.25,
          child: Transform.rotate(
            angle: pi/4,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(155.0),
                border: Border.all(width: 1.0,color: KSelectionTabColor)
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(152.0),
                  color: K2MainThemeColor
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    ),

    );
  }
}