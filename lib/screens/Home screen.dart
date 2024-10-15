import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook2/Blogic/Firebase/FireStore.dart';
import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/onboarding/onboarding.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:facebook2/screens/New%20Post.dart';
import 'package:facebook2/screens/NewStory.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Models/Post.dart';
import '../Models/Story.dart';
import '../Themes/App Colors.dart';
import '../Widgets/Post.dart';
import '../Widgets/models.dart';
import 'Welcome screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? Key}) : super(key: Key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = FirebaseAuth.instance;

  String? fullname = "";
  String? username = "";
  String? dateOfBirth = "";
  String? location = "";
  String? phonenumber = "";
  String? userimage = "";
  bool? isOlder16 = true;

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
          dateOfBirth = snapshot.data()!['dateOfBirth'];
          location = snapshot.data()!['location'];
          phonenumber = snapshot.data()!['phonenumber'];
          userimage = snapshot.data()!['userimage'];
          isOlder16 = snapshot.data()!['isOlder16'];
        });
      } else {
        print('No data');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(auth.currentUser!.uid);
    print("State");
    GetUserInfo();
    print("State2");
  }

  @override
  Widget build(BuildContext context) {
    return Backgound(
      child:  Scaffold(
        backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              CircleAvatar(
                radius: 25.r,
                backgroundImage: NetworkImage(userimage!),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                children: [
                  Text(
                    fullname!,
                    style: TextStyle(
                        color: Kblack,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    username!,
                    style: TextStyle(
                        color: K1Gray,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
              ),
              IconButton(
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SettingsPage()));
                  },
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                    color: Kblack,
                  )),
              
              IconButton(
                  onPressed: () {
                    FireStore.auth.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Onboardingscreen()));
                  },
                  icon: Icon(
                    Icons.logout_outlined,
                    size: 25,
                    color: IconColor,
                  )),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(width: 10.w,),
              Text("Feed",style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,color: IconColor),),
            ],
          ),
           SizedBox(
            height: 20.h,
          ),
          Container(
            height: 150.h,
            child: Container(
                height: 120,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Stories')
                      .snapshots(),
                  builder: (context, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snap.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: StoryWidget(
                              story: Story(
                                userName: snap.data!.docs[index]['username'],
                                userImage: snap.data!.docs[index]['userimage'],
                                storyImage: snap.data!.docs[index]
                                    ['storyimage'],
                                date: '20-3-2024',
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )),
          ),
          Row(
            children: [
              SizedBox(
                width: 50.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewPost(
                                userimage: userimage,
                                username: username,
                              )));
                },
                //   try{
                //     FireStore.AddPost("Mariam","https://img.freepik.com/free-photo/portrait-person-with-handwritten-text-it_23-2150734496.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais","https://img.freepik.com/free-photo/portrait-person-with-handwritten-text-it_23-2150734496.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais","this is the first post", "2024-02-23");
                //   }catch(e){print(e);}
                // },
                child: Container(
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: K2AccentStrocke),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Icon(
                        CupertinoIcons.add_circled_solid,
                        color: AppColors.backgroundColor,
                        size: 17,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        "Post",
                        style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewStory(
                                username: username,
                                userimage: userimage,
                              )));
                },
                child: Container(
                  width: 120.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: K1Gray),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Icon(
                        Icons.image,
                        color: Kwhite,
                        size: 17,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        " Story",
                        style: TextStyle(
                            color: Kwhite,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snap.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snap.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PostWidget(
                        post: Post(
                          userName: snap.data!.docs[index]['username'],
                          userImage: snap.data!.docs[index]['userimage'],
                          postImage: snap.data!.docs[index]['postimage'],
                          des: snap.data!.docs[index]['des'],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )),
        ]),
      ),
    ));
  }
}
