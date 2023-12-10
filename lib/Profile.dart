import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/profilescreen.png",
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(100)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              "https://img.freepik.com/free-photo/handsome-bearded-guy-posing-against-white-wall_273609-20597.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699833600&semt=ais",
                              fit: BoxFit.cover,
                            ))),
                  ),
                  Text(
                    "Chandan Vasu",
                    style: GoogleFonts.robotoSlab(
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                  Text(
                    "chandanvasu@gmail.com",
                    style: GoogleFonts.robotoSlab(
                        textStyle: TextStyle(
                      fontSize: 11,
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 370,
                      width: 350,
                      child: Card(
                          elevation: 0.5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(13),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset("assets/logout.png"),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        "Log out",
                                        style: GoogleFonts.robotoSlab(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13)),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: SizedBox(
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/delete.png"),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "Account Delete",
                                          style: GoogleFonts.robotoSlab(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 250),
                                  child: Text(
                                    "Develop By VasuX",
                                    style: GoogleFonts.robotoSlab(
                                        textStyle: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  )
                ],
              ))),
    );
  }
}
