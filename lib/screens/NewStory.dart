import 'dart:io';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Blogic/Firebase/FireStore.dart';
import '../Themes/App Colors.dart';

class NewStory extends StatefulWidget {
  NewStory({super.key, required this.username, required this.userimage});
  String? username;
  String? userimage;
  @override
  State<NewStory> createState() => _NewStoryState();
}

class _NewStoryState extends State<NewStory> {
  bool getimage = false;
  File? file;
  TextEditingController title = TextEditingController();
  String url = "mariam";

  UploadImage_gallery() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        file = File(image!.path);
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

  UploadImage_camera() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        file = File(image!.path);
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
                color: Colors.black,
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
                color: Colors.black,
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
    return Backgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            FireStore.AddStory(
                widget.username!, widget.userimage!, url, "2:30");
          } catch (e) {
            print(e);
          }
        },
        child: Icon(
          Icons.upload,
          color: K2AccentStrocke,
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Row(
            children: [
              SizedBox(width: 30.w),
              CircleAvatar(
                  radius: 22.r,
                  backgroundColor: K2AccentStrocke,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundImage: NetworkImage(widget.userimage!),
                  )),
              SizedBox(width: 10.w),
              Column(
                children: [
                  Text(
                    widget.username!,
                    style: TextStyle(
                        color: Kblack,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "public",
                    style: TextStyle(
                      color: K1Gray,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 160.w),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Kblack,
                  )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),

          // enterpassword? true:false
          // enterpassword? home:reload

          getimage
              ? Container(
                  width: MediaQuery.sizeOf(context).width / 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.78,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(file!),
                      //    image: NetworkImage(url),
                      fit: BoxFit.cover,
                    ),
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
                  child: Container(
                    width: MediaQuery.sizeOf(context).width / 0.8,
                    height: MediaQuery.sizeOf(context).height * 0.78,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: K1Gray,
                        width: 2.w,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Icon(Icons.image,
                              size: 40, color:Kblack),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                                color: Kblack,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    ));
  }
}
