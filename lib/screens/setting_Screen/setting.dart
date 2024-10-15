import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/Home%20screen.dart';
import 'package:facebook2/screens/Navi.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/new%20screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color Kblack = Color(0xFF000000);
Color Kwhite = Color(0xFFFFFFFF);

Color K1Gray = Color(0xFF4E4E4E);
Color K1LightGray = Color(0xFFC4C4C4);

Color K2AccentStrocke = Color(0xFF25A0B0);
Color K2MainThemeColor = Color.fromARGB(255, 206, 249, 245);

Color K3Pink = Color(0xFFFF5C8CC6);
Color K3AccentLines = Color.fromARGB(255, 229, 237, 200);

Color KCaption = Color(0xFF656565);
Color KSelectionTabColor = Color(0xFF7DB9B3);
Color IconColor = Colors.black;
Color account = Color(0xFF25A0B0);

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool th = true;
  @override
  Widget build(BuildContext context) {
    return Backgound(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        
          ),
       backgroundColor: Colors.transparent,
      body: Column(
      
        children: [
 
          SizedBox(height: 30.h,),
          Row(
            children: [
               SizedBox(width: 80.w,),
              Text("User Theme",style: TextStyle(color: Kblack,fontSize: 40.sp,fontWeight: FontWeight.bold),),
            ],
          ),
          Image.asset("assets/images/switch.png"),
          SizedBox(height: 20,),
          Row(
            children: [
              SizedBox(width: 50,),
              Container(
                
                height: 50,
                width: 300,
                 decoration: BoxDecoration(
                        color: K1Gray,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                // margin: EdgeInsets.fromLTRB(150, 20, 0, 0),
                // //  padding: const EdgeInsets.fromLTRB(300, 0, 0, 0),
                  
                    child: Row(
                      children: [
                        SizedBox(width: 30.w,),
                        Text("Switsh", style: TextStyle(color: Kwhite ,fontWeight: FontWeight.bold, fontSize: 20.sp)),
                        SizedBox(width: 100.w,),
                        Switch(
                          value: th,
                          onChanged: (value) {
                            if (th) {
                              setState(() {
                                Kblack = Color(0xFF000000);
                                Kwhite = Color(0xFFFFFFFF);
                        
                                K1Gray = Color(0xFF4E4E4E);
                                K1LightGray = Color(0xFFC4C4C4);
                        
                                K2AccentStrocke = Color(0xFF25A0B0);
                                K2MainThemeColor = Color.fromARGB(255, 206, 249, 245);
                        
                                KCaption = Color(0xFF656565);
                                 IconColor=Colors.black;
                                 account = Color(0xFF25A0B0);
                                
                        
                                th = false;
                              });
                            } else {
                              setState(() {
                                  Kblack = Colors.white;
                                  Kwhite = Colors.black;
                        
                                  K1Gray = Colors.white;
                                  K1LightGray = Color(0xFFC4C4C4);
                                 K2AccentStrocke = Color(0xFF25A0B0);
                                 
                                 K2MainThemeColor =Color(0xFF25A0B0);
                        
                                KCaption = Color(0xFF656565);
                                IconColor=Colors.white;
                                account = Colors.white;
                               
                                
                                th = true;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                 
                ),
            ],
          ),
        ],
      ),
    ));
  }
}
