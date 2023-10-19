// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Species extends StatelessWidget {
  List<dynamic> arrTypes;
  String test;
  Species({super.key, required this.arrTypes, required this.test});

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
                    onPressed: () {},
                    style: FilledButton.styleFrom(backgroundColor: Colors.green,
                    
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
