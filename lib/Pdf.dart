import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class Pdfview extends StatefulWidget {
  final String pdfUrl;

  Pdfview({required this.pdfUrl});


  @override
  State<Pdfview> createState() => _PdfviewState();
}

class _PdfviewState extends State<Pdfview> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SfPdfViewer.network(widget.pdfUrl,),
        ),
      ),
    );
  }
}
