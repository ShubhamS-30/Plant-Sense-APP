import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseaseInformation extends StatelessWidget {
  final String disease;
  final String info;
  const DiseaseInformation(
      {super.key, required this.disease, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          disease,
          style: GoogleFonts.ebGaramond(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
              fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 41, 36, 36),
              Color.fromARGB(255, 127, 60, 39),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 40),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  info,
                  style: GoogleFonts.ebGaramond(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
