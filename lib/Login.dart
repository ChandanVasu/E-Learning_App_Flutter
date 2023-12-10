import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plvasu/Home.dart';

import 'Signin.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text(
      //     "Login",
      //     style: GoogleFonts.rubik(
      //         textStyle:
      //         TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
      //   ),
      //   elevation: 1,
      //   backgroundColor: Colors.white,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/Login.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            SizedBox(
              height: 300,
              width: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 1.0,
                color: Color(0xFFFF1E0D5),
                // color: Colors.transparent,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Color(0xFFFF0F3F7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter You Email',
                                  labelStyle: GoogleFonts.robotoSerif(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12)),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          color: Color(0xFFFF0F3F7),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Enter You Password',
                                  labelStyle: GoogleFonts.robotoSerif(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12)),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          },
                          child: Card(
                              color: Color(0xFFF0000FF),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Center(
                                      child: Text(
                                    "Login",
                                    style: GoogleFonts.robotoSerif(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  )))),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account",
                          style: GoogleFonts.robotoSerif(
                              textStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13)),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signin()),
                            );
                          },
                          child: Text(
                            "Signin",
                            style: GoogleFonts.robotoSerif(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13,color: Colors.blue)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
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
      ),
    );
  }
}
