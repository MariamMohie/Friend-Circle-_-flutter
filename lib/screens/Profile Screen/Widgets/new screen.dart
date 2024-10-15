import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook2/Blogic/Firebase/Auth.dart';
import 'package:facebook2/Models/ProfilePost.dart';
import 'package:facebook2/Models/Story.dart';
import 'package:facebook2/Themes/App%20Colors.dart';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/Widgets/Profile%20Post.dart';
import 'package:facebook2/Widgets/models.dart';
import 'package:facebook2/screens/EditUserInfo.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/background.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen2 extends StatefulWidget {
  const ProfileScreen2({Key? key}) : super(key: key);

  @override
  State<ProfileScreen2> createState() => _ProfileScreen2State();
}

class _ProfileScreen2State extends State<ProfileScreen2> {
  final auth = FirebaseAuth.instance;
  String fullname = '';
  String username = '';
  String userimage = '';
  int? posts_count;
  bool showStories = true;

  Future<void> GetUserInfo() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          fullname = snapshot.data()!['fullname'];
          username = snapshot.data()!['username'];
          userimage = snapshot.data()!['userimage'];
        });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    GetUserInfo();
  }

  void toggleContent(bool showStories) {
    setState(() {
      this.showStories = showStories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProfileBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    CircleAvatar(
                      radius: 85.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 84.r,
                        backgroundImage: NetworkImage(
                          userimage,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100.w,
                  ),
                  Text(
                    fullname,
                    style: TextStyle(
                      color: Kblack,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditUserInfo(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Kblack,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 110.w,
                  ),
                  Text(
                    '@$fullname',
                    style: TextStyle(
                      color: Kblack,
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Column(
                    children: [
                     Text(
                        "Posts",
                        style: TextStyle(color: Kblack, fontSize: 15),
                      ),
                      Text(
                        '$posts_count',
                        style: TextStyle(
                          color: Kblack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                   Column(
                    children: [
                      Text(
                        "Followers",
                        style: TextStyle(color: Kblack, fontSize: 15),
                      ),
                      Text(
                        "50K",
                        style: TextStyle(
                          color: Kblack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                   Column(
                    children: [
                      Text(
                        "Following",
                        style: TextStyle(color: Kblack, fontSize: 15),
                      ),
                      Text(
                        "200",
                        style: TextStyle(
                          color: Kblack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Container(
                    width: 220.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: K1Gray,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        "Follow",
                        style: TextStyle(
                          color: Kwhite,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: K1Gray),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child:  Icon(
                      Icons.chat_bubble,
                      color: K2AccentStrocke,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => toggleContent(true),
                    icon: Icon(
                    CupertinoIcons.play_circle,
                      color: showStories ?Kblack : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 60.w,),
                  IconButton(
                    onPressed: () => toggleContent(false),
                    icon: Icon(
                      CupertinoIcons.photo, 
                      color: !showStories ? Kblack : Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              showStories ? buildStories() : buildPosts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStories() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
            // Text(
            //   "Stories",
            //   style: TextStyle(
            //     color: AppColors.tertiaryColor,
            //     fontSize: 17.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            // SizedBox(
            //   width: 190.w,
            // ),
            
          ],
        ),
        Container(
          height: 150.h,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Stories')
                .where("userid", isEqualTo: Authentication.auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView.builder(
                itemCount: snap.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: StoryWidget(
                      story: Story(
                        userName: snap.data!.docs[index]['username'],
                        userImage: snap.data!.docs[index]['userimage'],
                        storyImage: snap.data!.docs[index]['storyimage'],
                        date: '22-2-2024',
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildPosts() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30.w,
            ),
          
          ],
        ),
        Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Posts')
                .where("userid", isEqualTo: Authentication.auth.currentUser!.uid)
                .snapshots(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return const CircularProgressIndicator();
              }
              return GridView.builder(
                itemCount: snap.data!.docs.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                   posts_count = snap.data!.docs.length;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:ProfilePostWidget(
                            profile: ProfilePost(
                              username: snap.data!.docs[index]['username'],
                              userimage: snap.data!.docs[index]['userimage'],
                              des: snap.data!.docs[index]['des'],
                              postImage: snap.data!.docs[index]['postimage'],
                            ),
                          ),
                    
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}