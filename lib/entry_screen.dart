// ignore_for_file: await_only_futures, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:plant_sense_1/disease_classification.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_sense_1/dictionary_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  String test = "TEST";
  Future<List> getSpecies() async {
    List<dynamic> ty = [];
    // for local server
    // String addr = 'http://192.168.45.226:5000/';

    // for hosted api
    String addr = 'https://plant-sense-api.onrender.com/';

    Uri url = Uri.parse('${addr}api/dict/species');

    final response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      setState(() {
        ty = jsonResponse['Species'];
      });
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
    return ty;
  }

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
            child: Text(
              'Disease Classification',
              style: GoogleFonts.ebGaramond(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.normal),
            ),
          ),
          const SizedBox(height: 30),
          FilledButton(
            onPressed: () async {
              List<dynamic> types = await getSpecies();

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Species(
                          arrTypes: types,
                          test: test,
                    )
                ),
              );
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              'Dictionary',
              style: GoogleFonts.ebGaramond(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 25,
                  fontStyle: FontStyle.normal),
            ),
          ),
        ],
      ),
    );
  }
}
