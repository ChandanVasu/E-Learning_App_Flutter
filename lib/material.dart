import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Pdf.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Study Material",
            style: GoogleFonts.rubik(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Pdflist(),
      ),
    );
  }
}

class Pdflist extends StatelessWidget {
  const Pdflist({Key? key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Material")
          .orderBy("Title", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var pdfDocuments = snapshot.data!.docs;
        if (pdfDocuments.isEmpty) {
          // If the Video subcollection is empty, display an image
          return Center(
            child: Image.asset('assets/notfile.png',height: 300,),
          );
        }
        return ListView.builder(
          itemCount: pdfDocuments.length,
          itemBuilder: (context, index) {
            var pdf = pdfDocuments[index].data() as Map<String, dynamic>;

            var title = pdf["Title"];
            var subtitle = pdf["Subtitle"];
            var pdfUrl = pdf["PdfUrl"];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pdfview(pdfUrl:pdfUrl),
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
                              "assets/material.png") // Replace with a download icon
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
