import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

import 'Course.dart';
import 'Free Course.dart';
import 'Notificatin.dart';
import 'Profile.dart';
import 'Videoplayer.dart';
import 'maintenance.dart';
import 'material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> images = [];
  final now_date = DateFormat('d-M-yyyy ').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    fetchImageUrls().then((imageUrls) {
      setState(() {
        images = imageUrls;
      });
    });
  }

  Future<List<String>> fetchImageUrls() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Image').get();
    final List<String> imageUrls = [];

    for (QueryDocumentSnapshot document in snapshot.docs) {
      final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      final String imageUrl = data['url'];
      imageUrls.add(imageUrl);
    }

    return imageUrls;
  }

//       NavBar Select Method Start

  int _selectedIndex = 0; // Initial selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle the click event for each item here
    switch (index) {
      case 0:
        // Handle Course item click
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Course()), // Navigate to CourseScreen
        );
        break;
      case 1:
        // Handle Material item click
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  MaterialScreen()), // Navigate to MaterialScreen
        );
        break;
      case 2:
        // Handle Notification item click
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Notifiction()), // Navigate to NotificationScreen
        );
        break;
      case 3:
        // Handle Profile item click
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile()), // Navigate to ProfileScreen
        );
        break;
    }
  }

  // NavBar Selected End

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.green));
    return Scaffold(
      // AppBar Start

      appBar: AppBar(
        title: Text(
          "e-Learning App",
          style: GoogleFonts.leagueSpartan(
              textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        elevation: 1.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      // AppBar End

      // Body Start

      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                height: 200,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: images.map((imagepath) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      width: 330,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 10,
                            color: Colors.white,
                          ),
                          borderRadius:
                              BorderRadius.circular(10.0), //<-- SEE HERE
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.network(
                              imagepath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              width: 330,
              height: 60,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hello! Chandan Yadav",
                        style: GoogleFonts.robotoSerif(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                      ),
                      Text(
                        now_date,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                height: 30,
                width: 310,
                child: Text(
                  "Expoler",
                  style: GoogleFonts.robotoSerif(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.black87)),
                )),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Course()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(width: 50, "assets/study.png"),
                            Text(
                              "All Course",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notifiction()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(width: 50, "assets/bell.png"),
                            Text(
                              "Notification",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MaterialScreen()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/material.png",
                              width: 50,
                            ),
                            Text(
                              "Material",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Profile()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(width: 50, "assets/profile.png"),
                            Text(
                              "Profile",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const maintenance()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(width: 50, "assets/exam.png"),
                            Text(
                              "Test",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => FreeCourse()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              "assets/free video.png",
                              width: 50,
                            ),
                            Text(
                              "Free Course",
                              style: GoogleFonts.robotoSerif(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        Container(
            alignment: Alignment.centerLeft,
            height: 30,
            width: 310,
            child: Text(
              "Popular Video",
              style: GoogleFonts.robotoSerif(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: Colors.black87)),
            )),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.5),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('ImageScroll')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final images = snapshot.data!.docs;

                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: images.map((imageDoc) {
                        final imageUrl = imageDoc['url'];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                imageUrl,
                                width: 200,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50,bottom: 10),
              child: Text(
                "Develop By VasuX.com",
                style: GoogleFonts.robotoSlab(
                    textStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
              ),
            )
          ],
        ),
      ),

      // Body End

      // NavBar Start

      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/study.png",
              height: 20,
            ),
            label: 'Course',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/material.png",
              height: 20,
            ),
            label: 'Material',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/bell.png",
              height: 20,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/profile.png",
              height: 20,
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.robotoSerif(
          textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        unselectedLabelStyle: GoogleFonts.robotoSerif(
          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        currentIndex: _selectedIndex,
        // Add this line to set the initial selected item
        onTap: _onItemTapped, // Add this line to specify the tap callback
      ),

      // NavBar End
    );
  }
}
