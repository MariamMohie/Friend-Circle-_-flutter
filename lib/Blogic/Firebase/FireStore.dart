import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Models/Post.dart';
import '../../Models/Story.dart';

class FireStore {
  static final auth = FirebaseAuth.instance;

  static Future<void> AddUserInfotest(
      String fullname,
      String username,
      String phonenumber,
      String dateOfBirth,
      String location,
      String userimage,
      bool isOder16,
      List<Post> posts,
      List<Story> stories) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .set({
      'fullname': fullname,
      'username': username,
      'phonenumber': phonenumber,
      'dateOfBirth': dateOfBirth,
      'location': location,
      'userimage': userimage,
      'isOder16': isOder16,
      'posts': posts,
      'story': stories,
    });
  }

  static Future<void> AddStory(
      String username, String userimage, String storyimage, String date) async {
    await FirebaseFirestore.instance.collection('Stories').add({
      'username': username,
      'userimage': userimage,
      'storyimage': storyimage,
      'date': date,
      'userid': auth.currentUser!.uid,
    });
  }

  static Future<void> AddPost(String username, String userimage,
      String postimage, String des, String date) async {
    await FirebaseFirestore.instance.collection('Posts').add({
      'username': username,
      'userimage': userimage,
      'postimage': postimage,
      'des': des,
      'date': date,
      'userid': auth.currentUser!.uid,
    });
  }

  static Future<void> AddSavedList(String username, String userimage,
      String postimage, String date, String des) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .collection("saved_list")
        .add({
      'username': username,
      'userimage': userimage,
      'postimage': postimage,
      'date': date,
      'des': des,
    });
  }
}
