import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifiction extends StatelessWidget {
  const Notifiction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.rubik(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: VideoListWidget(),
    );
  }
}

class VideoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Notification')
          .orderBy('No', descending: true,)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var notificationDocuments = snapshot.data!.docs;
        if (notificationDocuments.isEmpty) {
          // If the Video subcollection is empty, display an image
          return Center(
            child: Image.asset(
              'assets/notfile.png',
              height: 300,
            ),
          );
        }

        return ListView.builder(
          itemCount: notificationDocuments.length,
          itemBuilder: (context, index) {
            var notification =
                notificationDocuments[index].data() as Map<String, dynamic>;
            var title = notification['Title'];
            var subtitle = notification['Subtitle'];
            var time = notification['Time'];
            var date = notification['Date'];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NotificationView(
                          Title: title,
                          Subtitle: subtitle,
                          Date: date,
                          Time: time)),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/bell.png",
                        height: 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    title,
                                    style: GoogleFonts.robotoSlab(
                                        textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    )),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (index < 3)
                                      Image.asset(
                                        "assets/newgif.gif",
                                        height: 20,
                                      ),
                                    Text(
                                      " 🕐 ${time}",
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              subtitle,
                              style: GoogleFonts.robotoSlab(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.grey)),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // SizedBox(height: 5,),
                            // Text("📅 ${ date}",style: GoogleFonts.robotoSlab(
                            //     fontSize: 10,
                            //     fontWeight: FontWeight.bold,
                            //     color: Colors.grey
                            // ),),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text(time),Text(date),
                            //
                            //   ],
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class NotificationView extends StatelessWidget {
  final String Title;
  final String Subtitle;
  final String Date;
  final String Time;

  NotificationView({
    required this.Title,
    required this.Subtitle,
    required this.Date,
    required this.Time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: GoogleFonts.rubik(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Title,
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " 🕐 ${Time}",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "📅  ${Date}",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 2,
                      child: Container(
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Subtitle,
                      style: GoogleFonts.robotoSlab(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Develop By VasuX",
              style: GoogleFonts.robotoSlab(
                  textStyle: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
