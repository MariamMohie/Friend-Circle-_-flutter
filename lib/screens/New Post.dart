import 'dart:io';
import 'package:facebook2/Blogic/Firebase/FireStore.dart';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/Home%20screen.dart';
import 'package:facebook2/screens/Navi.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:path/path.dart';
import 'package:facebook2/Themes/App%20Colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class NewPost extends StatefulWidget {
  NewPost({super.key, required this.username, required this.userimage});
  String? username;
  String? userimage;

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  bool getimage = false;
  File? file;
  String? url;
  TextEditingController des = TextEditingController();

  UploadImage() async {
    ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
        getimage = true;
      });

      var imgname = basename(image.path);
      var ref = FirebaseStorage.instance.ref("Posts/$imgname");
      await ref.putFile(file!);
      url = await ref.getDownloadURL();
      FireStore.AddPost(
          "Mariam",
          "https://img.freepik.com/free-photo/abstract-watercolor-guitar-exploding-with-colorful-motion-generated-by-ai_188544-19725.jpg?size=626&ext=jpg&ga=GA1.1.1454705726.1706974768&semt=ais",
          url!,
          "Hi",
          "3:30pm");
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
    return  Backgound(
      child: Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.userimage!),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      widget.username!,
                      style: TextStyle(
                          color: Kblack,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "22-3-2024",
                      style: TextStyle(
                          color: K1Gray, fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(
                  width: 145.w,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 25,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: des,
                decoration: InputDecoration(hintText: "Caption"),
              ),
            ),
            // Image Section
            getimage
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 350.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: FileImage(file!), fit: BoxFit.cover)),
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
                      width: MediaQuery.of(context).size.width,
                      height: 350.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: K1Gray,
                          width: 2.w,
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100.h,
                          ),
                          Icon(
                            CupertinoIcons.photo,
                            size: 40,
                            color: Kblack,
                          ),
                          Text(
                            "Add Photo",
                            style: TextStyle(
                                color: Kblack,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
        
            SizedBox(
              height: 50.h,
            ),
            Center(
                child: GestureDetector(
              onTap: () async {
                await FireStore.AddPost(widget.username!, widget.userimage!, url!,
                    des.text, "3:30pm");
                  showDialog(
        context: context,
        barrierDismissible: false, // Prevent user from closing while uploading
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
            );
        
            // Simulate post upload (replace with your actual upload logic)
            Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context); // Hide loading indicator
        
        // Show success popup
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success!'),
              content: const Text('Your post has been uploaded successfully.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: GestureDetector(
                    onTap: () {
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Navi()));
                    },
                    child: const Text('OK')),
                ),
              ],
            );
          },
        );
            });
        
              
              },
            
              
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  child: Center(
                      child: Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: K2AccentStrocke,
                  ),
                ),
              
            )),
          ],
        ),
      ),
    ));
  }
}
