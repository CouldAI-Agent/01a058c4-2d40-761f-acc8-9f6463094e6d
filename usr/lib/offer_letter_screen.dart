import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'dart:typed_data';

class OfferLetterScreen extends StatefulWidget {
  const OfferLetterScreen({super.key});

  @override
  State<OfferLetterScreen> createState() => _OfferLetterScreenState();
}

class _OfferLetterScreenState extends State<OfferLetterScreen> {
  Future<Uint8List> _generatePdf(PdfPageFormat format) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Text('INNOBYTE SERVICES'),
              ),
              pw.SizedBox(height: 20),
              pw.Text('Date: 22nd May, 2024'),
              pw.Text('Name: Abhishek Kushwaha'),
              pw.Text('Address: India'),
              pw.SizedBox(height: 20),
              pw.Text('Dear Abhishek Kushwaha,'),
              pw.SizedBox(height: 10),
              pw.Text(
                'Congratulations! We are thrilled to offer you the position of Mobile App Development Intern at Innobyte Services.',
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'During your internship, you will have the opportunity to gain hands-on experience and apply your skills in a professional environment.',
              ),
              pw.SizedBox(height: 10),
              pw.Text(
                'Your internship will start on 22nd May, 2024. Please note that this is an unpaid internship.',
              ),
              pw.SizedBox(height: 20),
              pw.Text('Sincerely,'),
              pw.SizedBox(height: 30),
              pw.Text('Priyanshu'),
              pw.Text('HR Manager'),
              pw.Text('Innobyte Services'),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offer Letter'),
      ),
      body: PdfPreview(
        build: (format) => _generatePdf(format),
      ),
    );
  }
}
