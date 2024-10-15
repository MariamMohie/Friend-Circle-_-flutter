import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/Story.dart';
import '../Models/StoryInfo.dart';
import '../Themes/App Colors.dart';
import '../screens/Story screen.dart';

class StoryWidget extends StatefulWidget {
  StoryWidget({super.key, required this.story});
  Story? story;
  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70.w,
        height: 120.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoryView(
                                storyInfo: StoryInfo(
                              username: widget.story!.userName,
                              storyImg: widget.story!.storyImage,
                              userImg: widget.story!.userImage,
                              date: DateTime.now().toString(),
                            ))));
              },
              child: Container(
                  width: 70.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: NetworkImage(widget.story!.storyImage!),
                        fit: BoxFit.cover),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 10.r,
                  backgroundColor: K2AccentStrocke,
                  child: CircleAvatar(
                    radius: 9.r,
                    backgroundImage: NetworkImage(widget.story!.userImage!),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.story!.userName!,
                    style: TextStyle(
                        color: Kblack,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ));
  }
}
