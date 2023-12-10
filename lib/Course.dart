import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Videoplayer.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Course",
          style: GoogleFonts.rubik(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: CourseCard(),
    );
  }
}

class CourseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Course')
          .orderBy('Title', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var courseDocuments = snapshot.data!.docs;

        return ListView.builder(
          itemCount: courseDocuments.length,
          itemBuilder: (context, index) {
            var course = courseDocuments[index].data() as Map<String, dynamic>;
            var title = course['Title'];
            var subtitle = course['Subtitle'];
            var price = course['Price'];
            var url = course['Url'];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => VideoListPage(
                        courseDocumentID: courseDocuments[index].id,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 260,
                  width: 330,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            url,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  title,
                                  style: GoogleFonts.leagueSpartan(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                price,
                                style: GoogleFonts.leagueSpartan(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  subtitle,
                                  style: GoogleFonts.leagueSpartan(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (index < 1)
                                Image.asset(
                                  "assets/newgif.gif",
                                  height: 20,
                                )
                            ],
                          )
                        ],
                      ),
                    ),
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

class VideoListPage extends StatelessWidget {
  final String courseDocumentID;

  VideoListPage({required this.courseDocumentID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video",
          style: GoogleFonts.rubik(
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: VideoList(courseDocumentID: courseDocumentID),
    );
  }
}

class VideoList extends StatelessWidget {
  final String courseDocumentID;

  VideoList({required this.courseDocumentID});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Course')
          .doc(courseDocumentID)
          .collection('CourseList')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        var videoDocuments = snapshot.data!.docs;
        if (videoDocuments.isEmpty) {
          // If the Video subcollection is empty, display an image
          return Center(
            child: Image.asset(
              'assets/notfile.png',
              height: 300,
            ),
          );
        }

        return ListView.builder(
          itemCount: videoDocuments.length,
          itemBuilder: (context, index) {
            var video = videoDocuments[index].data() as Map<String, dynamic>;
            var title = video['Title'];
            var subtitle = video['Subtitle'];
            var videourl = video['VideoUrl'];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Youtube(
                          VideoUrl: videourl,
                          VideoTitle: title,
                          VideoSubtitle: subtitle),
                    ),
                  );
                },
                child: Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        title,
                        style: GoogleFonts.robotoSerif(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        subtitle,
                        style: GoogleFonts.robotoSerif(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 13)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.asset(
                              "assets/videoclass.png") // Replace with a download icon
                          ),
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
