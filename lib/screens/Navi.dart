import 'package:facebook2/Themes/colors.dart';
import 'package:facebook2/screens/EditUserInfo.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/background.dart';
import 'package:facebook2/screens/Profile%20Screen/Widgets/new%20screen.dart';
import 'package:facebook2/screens/SavedList.dart';
import 'package:facebook2/screens/setting_Screen/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'Home screen.dart';
import 'Profile Screen/Profile screen.dart';
import 'UserInfo.dart';

class Navi extends StatefulWidget {
  const Navi({
    Key? key,
  }) : super(key: key);

  @override
  State<Navi> createState() => _NaviState();
}

class _NaviState extends State<Navi> {
  dynamic selected;
  var heart = false;
  PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, //to make floating action button notch transparent

      //to avoid the floating action button overlapping behavior,
      // when a soft keyboard is displayed
      // resizeToAvoidBottomInset: false,

      bottomNavigationBar: StylishBottomBar(
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.fade,
          iconStyle: IconStyle.animated,
          // opacity: 0.3,
        ),
        items: [
          BottomBarItem(
            icon: const Icon(
              CupertinoIcons.house_fill,
              size: 25,
            ),
            selectedIcon: const Icon(CupertinoIcons.house_fill),
            // selectedColor: Colors.teal,
            backgroundColor: Colors.teal,
            title: const Text('Home'),
            badge: const Text('9+'),
            showBadge: true,
          ),
          BottomBarItem(
            icon:  Icon(CupertinoIcons.heart ,size: 25, color: Colors.black,),
            selectedIcon:  Icon(CupertinoIcons.heart_fill, size: 25, color: Colors.black,),
            selectedColor:Kblack,
            unSelectedColor: Kblack,
            // backgroundColor: Colors.orange,
            title: const Text('Saved List'),
          ),
          // BottomBarItem(
          //   icon: const Icon(CupertinoIcons.add_circled_solid),
          //   selectedIcon: const Icon(Icons.add),
          //   selectedColor: Colors.black,
          //   unSelectedColor: Colors.black,
          //   backgroundColor: Colors.black,
          //   title: const Text('Story'),
          // ),
          BottomBarItem(
              icon: const Icon(
                CupertinoIcons.info,
              ),
              selectedIcon: const Icon(
                Icons.info_rounded,
              ),
              backgroundColor: Colors.black,
              selectedColor: Colors.black,
              title: const Text('User Info')),
          BottomBarItem(
              icon: const Icon(
                CupertinoIcons.person
                ,
              ),
              selectedIcon: const Icon(
                Icons.person,
              ),
              backgroundColor: Colors.black,
              selectedColor: Colors.black,
              title: const Text('Profile')),
        ],
        hasNotch: true,
        fabLocation: StylishBarFabLocation.center,
        currentIndex: selected ?? 0,
        onTap: (index) {
          controller.jumpToPage(index);
          setState(() {
            selected = index;
          });
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: PageView(
          controller: controller,
          children: const [
            HomeScreen(),
            SavedList(),
            EditUserInfo(),
            ProfileScreen2(),
          ],
        ),
      ),
    );
  }
}
