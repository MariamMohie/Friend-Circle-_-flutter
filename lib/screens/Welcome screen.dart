import 'dart:convert';

import 'package:facebook2/Blogic/Firebase/Auth.dart';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/onboarding.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Themes/App Colors.dart';
import '../firebase_options.dart';
import 'Navi.dart';
import 'SignIn.dart';
import 'SignUp.dart';

Future<void> main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        debugShowCheckedModeBanner: false,
        home:
           Authentication.auth.currentUser != null ? Navi() : Onboardingscreen(),
      ),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? Key}) : super(key: Key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Backgound(child:  Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height:90.h,
            ),
            Center(
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                width: 300.w,
                height: 300.h,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Column(
              children: [
                SizedBox(
                  width: 35.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Container(
                    width: 270.h,
                    height: 50.h,
                    child: Center(
                        child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                      ),
                    )),
                    decoration: BoxDecoration(
                        color: K2AccentStrocke,
                        borderRadius: BorderRadius.circular(40.r),
                        border: Border.all(
                            width: 3.h, color: K2AccentStrocke)),
                  ),
                ).animate().fade(duration: 2.seconds),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Container(
                   width: 270.h,
                    height: 50.h,
                    child: Center(
                        child: Text(
                      "SignIn",
                      style: TextStyle(
                        color: Kwhite,
                        fontSize: 25.sp,
                      ),
                    )),
                    decoration: BoxDecoration(
                        color: K1Gray,
                        borderRadius: BorderRadius.circular(40.r),
                        border: Border.all(
                            width: 3.h, color: K1Gray)),
                  ),
                ).animate().fade(duration: 2.seconds),
              ],
            )
          ],
        ),
      ),);
    
  }
}

final ThemeData KAppThemeData =_buildAppTheme();

ThemeData _buildAppTheme(){
  final base =ThemeData.light();
  final baseTextTheme =GoogleFonts.poppinsTextTheme(base.textTheme);
  return base.copyWith(
    scaffoldBackgroundColor: Kwhite,
    textTheme: baseTextTheme.copyWith(
      displayLarge:baseTextTheme.displayLarge!.copyWith(
        height: 58.5/39,
        fontWeight: FontWeight.w700,
        fontSize:39.0,
        color: Kblack, 
      ),
      displayMedium: baseTextTheme.displayMedium!.copyWith(
        height: 46.88/31.25,
        fontWeight: FontWeight.w500,
        fontSize:31.25,
        color: Kblack, 
      ),
      displaySmall: baseTextTheme.displaySmall!.copyWith(
        height: 37.5/25.0,
        fontWeight: FontWeight.w400,
        fontSize: 25.0,
        color: Kblack,
      ),
      headlineSmall: baseTextTheme.headlineSmall!.copyWith(
        height: 30.0/20.0,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
         color: Kblack,
      ),
      bodyLarge: baseTextTheme.bodyLarge!.copyWith(
         color: Kblack,
          fontWeight: FontWeight.w400,
      ),
      bodySmall: baseTextTheme.bodySmall!.copyWith(
        height: 21.0/14.0,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: Kblack,
      ),
      labelSmall: baseTextTheme.labelSmall!.copyWith(
        height: 19.2/12.8,
        fontSize: 12.8,
        color: KCaption,
        fontWeight: FontWeight.w400
      ),


    ),
  );
}