import 'package:flutter/material.dart';
import 'package:plant_sense_1/disease_classification.dart';
import 'package:google_fonts/google_fonts.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/img4.jpeg',
            width: 200,
            // color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 70,
          ),
          Text(
            'Plant  Sense',
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w700,
                fontSize: 40,
                color: Colors.white,
                fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 30),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DiseaseClassification()),
              );
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            child: Text('Disease Classification',
            style: GoogleFonts.ebGaramond(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 25,
              fontStyle: FontStyle.normal
            ),
            ),
          ),
        ],
      ),
    );
  }
}
