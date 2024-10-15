import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/StoryInfo.dart';
import '../Themes/App Colors.dart';

class StoryInfoWidget extends StatefulWidget {
  StoryInfoWidget({
    super.key,
    required this.storyInfo,
  });
  StoryInfo? storyInfo;

  @override
  State<StoryInfoWidget> createState() => _StoryInfoState();
}

class _StoryInfoState extends State<StoryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: NetworkImage(widget.storyInfo!.storyImg!),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  SizedBox(width: 30.w),
                  CircleAvatar(
                      radius: 30.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 28.r,
                        backgroundImage:
                            NetworkImage(widget.storyInfo!.userImg!),
                      )),
                  SizedBox(width: 10.w),
                  Column(
                    children: [
                      Text(
                        widget.storyInfo!.username!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        widget.storyInfo!.date!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 70.w),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.tertiaryColor,
                      )),
                ],
              ),
            ],
          )),
    );
  }
}
