import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Models/Post.dart';
import '../Models/ProfilePost.dart';
import '../Screens/PostView.dart';
import '../Themes/App Colors.dart';

class ProfilePostWidget extends StatefulWidget {
  ProfilePostWidget({
    super.key,
    required this.profile,
  });
  ProfilePost? profile;

  @override
  State<ProfilePostWidget> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePostWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostView(
                      post: Post(
                        userName: widget.profile!.username,
                        postImage: widget.profile!.postImage,
                        userImage: widget.profile!.userimage,
                        des: widget.profile!.des,
                      ),
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color:K2AccentStrocke, width: 2.w),
        ),
        child: Image.network(
          widget.profile!.postImage!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
