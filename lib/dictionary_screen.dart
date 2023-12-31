// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_sense_1/dictionary_specie_disease.dart';

class Species extends StatelessWidget {
  List<dynamic> arrTypes;
  final String addr;
  Species({
    super.key,
    required this.addr,
    required this.arrTypes,
  });

  Future<List> getSpecies(String dis) async {
    List<dynamic> ty = [];

    Uri url = Uri.parse('${addr}api/dict/species/$dis');

    final response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      ty = jsonResponse['Diseases'];
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
    return ty;
  }

  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 127, 60, 39),
        appBar: AppBar(
          title: Text(
            "Species of Plants",
            style: GoogleFonts.ebGaramond(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.normal),
          ),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () async {
                      List<dynamic> types = await getSpecies(arrTypes[index]);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SpeciesDisease(
                                  species: arrTypes[index],
                                  addr: addr,
                                  arrTypes: types,
                                )),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text(
                      arrTypes[index],
                      style: GoogleFonts.ebGaramond(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          itemCount: arrTypes.length,
        ));
  }
}
