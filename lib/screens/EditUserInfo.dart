import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/Profile%20Screen/Profile%20screen.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/background.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/new%20screen.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Blogic/Firebase/FireStore.dart';
import '../Models/Post.dart';
import '../Models/Story.dart';
import '../Themes/App Colors.dart';

class EditUserInfo extends StatefulWidget{
  const EditUserInfo ({Key?Key}):super(key:Key);

  @override
  State<EditUserInfo> createState()=>_EditUserInfoState();

}

class _EditUserInfoState  extends State<EditUserInfo>{
  String ?fullname;
  String ?username;
  String ?dateOfBirth;
  String ?location;
  String ? userimage;
  String ? phonenumber;
  bool isOlder16= false;
  List<Post>?posts;
  List<Story>?stories;
  String ? firstname;
  String ? lastname;
  String ? city;
  String ? country;
  String ?code;
  String ?phoneNumber;
  String ? isolder16;
  static final auth = FirebaseAuth.instance;

 Future<void> GetUserInfo() async{
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid).get().then ((snapshot) {
      if(snapshot.exists){
        setState(() {
          fullname=snapshot.data()!['fullname'];
          username=snapshot.data()!['username'];
          dateOfBirth=snapshot.data()!['dateOfBirth'];
          location=snapshot.data()!['location'];
          userimage=snapshot.data()!['userimage'];
          isOlder16=snapshot.data()!['isOder16'];
          phonenumber=snapshot.data()!['phonenumber'];
        });

      }else{
        print('No data');

      }
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return  ProfileBackground(child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(" Edit User Info"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CircleAvatar(
              radius: 80.r,
              backgroundImage: NetworkImage(userimage!)
                 
            ),
            SizedBox(height: 60.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 320.w,
                  height: 40.h,
                  child: FastTextField(
                    onChanged: (Value){
                      setState(() {
                        fullname =Value!;
                      });

                    },
                    name: 'field_first_name',
                    decoration: InputDecoration(
                        labelText: fullname,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                  ),
                ),

              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 320.w,
                  height: 40.h,
                  child: FastTextField(
                    onChanged: (Value){
                      setState(() {
                        username =Value!;
                      });

                    },
                    name: 'field_username',
                    decoration: InputDecoration(
                        labelText:username,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                  ),
                ),
              ],
            ),
           
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 320.w,
                  height: 50.h,
                  child: FastTextField(
                    onChanged: (Value){
                      setState(() {
                        location=Value!;
                      });

                    },
                    name: 'location',
                    decoration: InputDecoration(
                        labelText:location,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),

                Container(
                  width: 320.w,
                  height: 50.h,
                  child: FastTextField(
                    onChanged: (Value){
                      setState(() {
                        phonenumber =Value!;
                      });

                    },
                    name: 'phone_number',
                    decoration: InputDecoration(
                        labelText:phonenumber,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.r))),
                  ),
                ),
              ],
            ),

            Row(children: [
              SizedBox(width: 26.w,),
            ],),
            SizedBox(height: 20.h),
            Row(children: [
              SizedBox(width: 50.w,),
              GestureDetector(
                onTap: () {
                  try{
                    FireStore.AddUserInfotest(fullname!,
                        username!,phonenumber!,dateOfBirth!,location! ,
                        userimage!,
                        true,[],[]);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen2()));
                  }
                  catch(e){print(e);
                  }

                },
                child: Container(
                  width: 260.w,
                  height: 50.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.r),color: K1Gray),
                  child:
                  Center(child: Text("Save Changes",style: TextStyle(color:Kwhite,fontSize: 20.sp,fontWeight: FontWeight.bold),)),
                ),
              )
            ],)

          ],
        ),
      ),
    ));
  }
}