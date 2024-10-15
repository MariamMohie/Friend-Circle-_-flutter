import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/Themes/validation.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Blogic/Firebase/Auth.dart';
import '../Themes/App Colors.dart';
import 'SignIn.dart';
import 'UserInfo.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? Key}) : super(key: Key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Vaildation valid;
    return  Backgound(child:
     Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent, // solve for overflow
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
                      color: Kblack,
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
                  "Create",
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
                  "Account",
                  style: GoogleFonts.anton(
                      color: account,
                      fontWeight: FontWeight.bold,
                      fontSize: 40.sp),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emailcontroller,
                validator:Vaildation().emailVaild,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Your Email",
                  labelStyle: TextStyle(color:K1Gray),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: K1Gray)),
                  
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
              child: TextFormField(
                controller: passcontroller,
                validator:Vaildation().passwordVaild,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Your Password",
                  labelStyle: TextStyle(color: K1Gray),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.r),
                      borderSide: BorderSide(color: K1Gray)),
                  
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
                Authentication.signUpWithEmailAndPassword(
                    emailcontroller.text, passcontroller.text);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => UserInfo()));
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                child: Center(
                    child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                  ),
                )),
                decoration: BoxDecoration(
                    color: K2AccentStrocke,
                    borderRadius: BorderRadius.circular(30.r),
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
                    context, MaterialPageRoute(builder: (context) => UserInfo()));
              },
              child: Container(
                width: 300.w,
                height: 50.h,
                child: Row(
                  children: [
                    SizedBox(width: 20.w,),
                    Image.network("https://cdn-icons-png.freepik.com/256/300/300221.png?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",width: 30,height: 30,),
                     SizedBox(width: 15.w,),
                    Center(
                        child: Text(
                      "Signup With Google",
                      style: TextStyle(
                        color: Kwhite,
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
                SizedBox(width: 55.w),
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: K1Gray, fontSize: 15.sp),
                ),
                SizedBox(width: 5.w),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "SignIn",
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
