import 'Post.dart';
import 'Story.dart';

class User {
  String? fullName;
  String? userName;
  String? dateOfBirth;
  String? location;
  String? phoneNumber;
  String? userImg;
  bool? isOlder16;
  List<Post>? posts;
  List<Story>? story;
  User(
      {this.fullName,
      this.userName,
      this.dateOfBirth,
      this.location,
      this.phoneNumber,
      this.userImg,
      this.isOlder16,
      this.posts,
      this.story});
}
