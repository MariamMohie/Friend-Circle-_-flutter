import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook2/Blogic/Firebase/Auth.dart';
import 'package:facebook2/onboarding/widgets/background.dart';
import 'package:flutter/material.dart';
import '../Models/Post.dart';
import '../Widgets/Post.dart';

class SavedList extends StatefulWidget {
  const SavedList({super.key});

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Backgound(
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(Authentication.auth.currentUser!.uid)
              .collection("saved_list")
              .snapshots(),
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
        ),
      ),
    ));
  }
}
