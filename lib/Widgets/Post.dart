import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Blogic/Firebase/FireStore.dart';
import '../Models/Post.dart';
import '../Themes/App Colors.dart';

class PostWidget extends StatefulWidget {
  PostWidget({super.key, required this.post});
  Post? post;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  List <String> savedList =[];
    bool isSaved= false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        width: 350.w,
        height: 350.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(width: 2.w, color: K1LightGray)),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: K2AccentStrocke,
                  child: CircleAvatar(
                    radius: 23.r,
                    backgroundImage: NetworkImage(widget.post!.userImage!),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  children: [
                    Text(
                      widget.post!.userName!,
                      style: TextStyle(
                        color: Kblack,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "21 Feb 2024",
                      style: TextStyle(
                        color: K1Gray,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 120.w,
                ),
                IconButton(
  onPressed: () async {
       
    // Update icon state
    setState(() {
     isSaved = !isSaved; 
      // Assuming you have a boolean state variable 'isSaved'
    });

    // Add to SavedList
    await FireStore.AddSavedList(
      widget.post!.userName!,
      widget.post!.userImage!,
      widget.post!.postImage!,
      "3:30",
      widget.post!.des!,
    );

    // Show popup message on successful addition
    if (mounted) { // Check if widget is still mounted before showing popup
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Added to SavedList'),
          content: const Text('The post has been saved successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  },
  icon: Icon(
    
    isSaved ? Icons.bookmark : Icons.bookmark_border,
    color: Kblack,
    size: 25,
  ),
),

              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  widget.post!.des!,
                  style: TextStyle(
                    color: Kblack,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
           
            Container(
              width: 350.w,
              height: 220.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.post!.postImage!),
                      fit: BoxFit.cover)),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border,
                        color: Kblack)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.comment_outlined,
                        color: Kblack)),
                SizedBox(
                  width: 170.w,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share, color: Kblack)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
