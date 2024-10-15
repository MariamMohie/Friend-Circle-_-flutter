import 'dart:io';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/Themes/validation.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../Blogic/Firebase/FireStore.dart';
import '../Themes/App Colors.dart';
import 'Navi.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  String firstname = "";
  String lastname = "";
  String username = "";
  String dateOfBirth = "";
  String country = "";
  String city = "";
  String code = "";
  String phonenumber = "";
  bool isOlder16 = false;
  bool getimage = false;
  File? file;
  TextEditingController title = TextEditingController();
  String url = "Mariam";

  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image.path);
        getimage = true;
      });

      var metadata = SettableMetadata(
        contentType: "image/jpeg",
      );
      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref(imgname);
      await ref.putFile(file!, metadata);

      url = await ref.getDownloadURL();
    }
  }

  Widget upload_way() {
    return Container(
      width: 215.w,
      height: 150.h,
      decoration: BoxDecoration(
        color: K2MainThemeColor,
        border: Border.all(
          color: K2MainThemeColor,
          width: 2.w,
        ),
      ),
      child: Center(
          child: Row(
        children: [
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () async {
              await UploadImage_gallery();
            },
            child: Container(
              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Kblack,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Icon(CupertinoIcons.photo, size: 40, color: AppColors.backgroundColor),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Add from gallery',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          GestureDetector(
            onTap: () async {
              await UploadImage_camera();
            },
            child: Container(
              height: 80.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: Kblack,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Icon(CupertinoIcons.camera,
                      size: 40, color: AppColors.backgroundColor),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Add from Camera',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Row(children: [
              SizedBox(width: 40.w,),
              Text("User Info",style: Theme.of(context).textTheme.displaySmall,)
            ],),
            SizedBox(height: 30.h),
            getimage
                ? GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundImage: FileImage(file!),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        SmartDialog.show(builder: (context) {
                          return upload_way();
                        });
                      });
                    },
                    child: CircleAvatar(
                      radius: 80.r,
                      backgroundImage: NetworkImage(
                          "https://img.freepik.com/free-photo/portrait-person-with-handwritten-text-it_23-2150734496.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais"),
                    ),
                  ),
            SizedBox(height: 50.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 150.w,
                  height: 40.h,
                  child: FastTextField(
                    onChanged: (Value) {
                      setState(() {
                        firstname = Value!;
                      });
                    },
                    name: 'field_first_name',
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 150.w,
                  height: 40.h,
                  child: FastTextField(
                    onChanged: (Value) {
                      setState(() {
                        lastname = Value!;
                      });
                    },
                    name: 'field_last_name',
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              width: 320.w,
              height: 40.h,
              child: FastTextField(
                onChanged: (Value) {
                  setState(() {
                    username = Value!;
                  });
                },
                name: 'field_username',
                decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r))),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              width: 320.w,
              height: 50.h,
              child: FastDatePicker(
                onChanged: (Value) {
                  setState(() {
                    dateOfBirth = Value! as String;
                  });
                },
                name: 'date_picker',
                firstDate: DateTime(1970),
                lastDate: DateTime(2040),
                decoration: InputDecoration(
                    labelText: 'Enter Your age',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r))),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Container(
                  width: 150.w,
                  height: 50.h,
                  child: FastDropdown<String>(
                    onChanged: (Value) {
                      setState(() {
                        country = Value!;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Your Country',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                    name: 'dropdown_country',
                    items: [
                      'Egypt',
                      'Iraq',
                      'Saudi Arabia',
                      'Lebanon',
                      'Finland',
                    ],
                    initialValue: 'Finland',
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  width: 150.w,
                  height: 50.h,
                  child: FastDropdown<String>(
                    onChanged: (Value) {
                      setState(() {
                        city = Value!;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Your Country',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                    name: 'dropdown_city',
                    labelText: 'Dropdown Field',
                    items: [
                      'Baghdad',
                      'Riyadh',
                      'Beirut',
                      'Seoul',
                      'london',
                      'Finland'
                    ],
                    initialValue: 'Finland',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(width: 20.w),
              
                Container(
                  width: 320.w,
                  height: 70.h,
                  child: TextFormField(
                    onChanged: (Value) {
                      setState(() {
                        phonenumber = Value!;
                      });
                    },
                    validator: Vaildation().phoneVaild,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        labelText: 'Phone Numbe',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(
                  width: 26.w,
                ),
                Container(
                  width: 320.w,
                  height: 50.h,
                  child: FastSwitch(
                    onChanged: (Value) {
                      setState(() {
                        isOlder16 = Value!;
                      });
                    },
                    decoration: InputDecoration(
                        labelText: 'Remember',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r))),
                    name: 'switch',
                    titleText: 'Are you older than 16',
                    contentPadding: EdgeInsets.fromLTRB(0.8, 0, 0, 0),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                SizedBox(
                  width: 40.w,
                ),
                GestureDetector(
                  onTap: () {
                    try {
                      FireStore.AddUserInfotest(
                          firstname + " " + lastname,
                          username,
                          phonenumber,
                          dateOfBirth,
                          country + "_" + city,
                          url,
                          isOlder16, [], []);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Navi()));
                    } catch (e) {
                      print(e);
                    }
                  },

                  child: Container(
                    width: 300.w,
                    height: 47.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40.r),
                        color: K1Gray),
                    child: Center(
                        child: Text(
                      "Join our family",
                      style: TextStyle(
                          color: Kwhite,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
