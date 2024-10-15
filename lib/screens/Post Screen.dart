import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook Post',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // User Info Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais'),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mariam Mohie',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Post Content Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(hintText: "Caption"),
              ),
            ),
            // Image Section
            Image.network(
              'https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            // Like, Comment, Share Section
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: <Widget>[
            //       Row(
            //         children: <Widget>[
            //           Icon(Icons.thumb_up),
            //           SizedBox(width: 4),
            //           Text('Like'),
            //         ],
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Icon(Icons.comment),
            //           SizedBox(width: 4),
            //           Text('Comment'),
            //         ],
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Icon(Icons.share),
            //           SizedBox(width: 4),
            //           Text('Share'),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Post Button Section
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle post action
                  // For example, you can show a dialog or perform an action when the button is pressed
                },
                child: Text('Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
