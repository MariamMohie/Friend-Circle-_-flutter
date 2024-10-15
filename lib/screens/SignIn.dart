import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Blogic/Firebase/Auth.dart';
import '../Themes/App Colors.dart';
import 'Navi.dart';
import 'SignUp.dart';
// import 'package:project1/Amazon/home%20screen.dart';
// import 'package:project1/Amazon/signup.dart';
// import 'package:project1/Amazon/themes.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? Key}) : super(key: Key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Backgound(child:
     Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false, // solve for overflow
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    ))
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Log Into",
                  style: GoogleFonts.anton(
                      color: Kblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Your Account",
                  style: GoogleFonts.anton(
                      color: K2AccentStrocke,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Your Email",
                  labelStyle: TextStyle(color: K1Gray),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.r),
                      borderSide: BorderSide(color:K1Gray)),
                
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.mail,
                      color: K1Gray,
                      weight: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Your Password",
                  labelStyle: TextStyle(color: K1Gray),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.r),
                      borderSide: BorderSide(color: AppColors.secondaryColor)),
                 
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                     CupertinoIcons.eye_fill,
                      color: K1Gray,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            GestureDetector(
              onTap: () {
                Authentication.signInWithEmailAndPassword(
                    emailcontroller.text, passcontroller.text);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Navi()));
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                  ),
                )),
                decoration: BoxDecoration(
                    color: K2AccentStrocke,
                    borderRadius: BorderRadius.circular(40.r),
                    border:
                        Border.all(width: 3.h, color: K2AccentStrocke)),
              ),
            ).animate().fade(duration: 2.seconds),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Authentication.signInWithGoogle();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Navi()));
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                child: Row(
                  children: [
                    SizedBox(width: 15.w,),
                    Image.network("https://cdn-icons-png.freepik.com/256/300/300221.png?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",width: 30,height: 30,),
                     SizedBox(width: 17.w,),
                    Center(
                        child: Text(
                      "SignIn With Google",
                      style: TextStyle(
                        color:Kwhite,
                        fontSize: 21.sp,
                      ),
                    )),
                  ],
                ),
                decoration: BoxDecoration(
                    color: K1Gray,
                    borderRadius: BorderRadius.circular(40.r),
                    border:
                        Border.all(width: 3.h, color: K1Gray)),
              ),
            ).animate().fade(duration: 2.seconds),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(width: 50.w),
                Text(
                  "Don't have an Account Yet?",
                  style:
                      TextStyle(color: K1Gray, fontSize: 15.sp),
                ),
                SizedBox(width: 5.w),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                          color: K2AccentStrocke,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
