import 'dart:math';

import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/Navi.dart';
import 'package:facebook2/screens/Welcome%20screen.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}


class _OnboardingscreenState extends State<Onboardingscreen> {
  int _pageIndex=0;
  
  _onPageChanged(index){
   setState(() {
      _pageIndex= index;
   });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Backgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h,),
            Expanded(
             flex: 2,
              child: PageView.builder(
              itemCount: 3,
              itemBuilder: (context,index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome to',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Kblack),),
                    Text('Friend Circle ${index+1}',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Kblack),),
                     Text('Is the place where you enjoy your time',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Kblack),),

                    SizedBox(height: 20,),
                    Image.asset("assets/images/onboard.png",width: 340,height: 340,)

                  ],
                );
            },
            onPageChanged: _onPageChanged,
            )),
            //create dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3,(index)=> Container(
                height: 12.0,
                width: 12.0,
                margin: const EdgeInsets.symmetric(horizontal: 3.5),
                decoration: BoxDecoration(shape: BoxShape.circle,
                color: _pageIndex ==index ? Kblack:null,
                border: Border.all(width: 1,color: Kblack)),
                

              )),
              
            ),
            // create The button Next
            Expanded(child: GestureDetector(
              onTap: () {
                
              },
              child: Stack(children: [
                Positioned(
                  bottom: -50,
                  right: -50,
                  child: Transform.rotate(
                    angle: pi/4,
                    child: Container(
                      height:size.width * 0.7,
                      width: size.width * 0.68,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Kblack),
                        borderRadius: BorderRadius.circular(87.0)
                    
                      ),
                      child: Container(
                        height: size.width * 0.65,
                        width: size.width * 0.62,
                        decoration: BoxDecoration(
                          color: _pageIndex.isEven? Kblack: K2MainThemeColor,
                          borderRadius: BorderRadius.circular(79.0),  
                        ),
                        child: Transform.rotate(
                          angle:- pi/4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()));
                                },
                                child: Text("Next",style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: _pageIndex.isEven? Kwhite: Kblack ),)),
                               SizedBox(width: 5,),
                               Icon(CupertinoIcons.arrow_right, color:  _pageIndex.isEven? Kwhite:Kblack,)
                            ]),
                        ),
                      ),
                      ),
                  ),
                )
              ]),
            ))

        ]),
      ),
    );
  }
}