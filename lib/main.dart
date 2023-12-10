import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plvasu/Signin.dart';

import 'Home.dart';
import 'Login.dart';
import 'Notificatin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(0XFFFDF0E9),
        systemNavigationBarColor: Color(0XFFFDF0E9)));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class VideoListWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('Course').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//
//         var videoDocuments = snapshot.data!.docs;
//
//         return ListView.builder(
//           itemCount: videoDocuments.length,
//           itemBuilder: (context, index) {
//             var video = videoDocuments[index].data() as Map<String, dynamic>;
//             var title = video['Title'];
//             var subtitle = video['Subtitle'];
//
//             return ListTile(
//               title: Text(title),
//               subtitle: Text(subtitle),
//             );
//           },
//         );
//       },
//     );
//   }
// }

//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Video Collection'),
//         ),
//         body: VideoListWidget(),
//       ),
//     );
//   }
// }
