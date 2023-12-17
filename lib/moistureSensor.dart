// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';
import 'package:dart_date/dart_date.dart';
import 'package:plant_sense_1/data.dart';

class MoistureSensor extends StatefulWidget {
  const MoistureSensor({super.key});

  @override
  State<MoistureSensor> createState() => _MoistureSensorState();
}

class _MoistureSensorState extends State<MoistureSensor> {
  List<String> reading = ["No Data Available!"];
  String wetSoil = "Soil is wet!";
  String drySoil = "Soil is dry!";
  List<String> timestamp = ['No Data Available!'];
  List<String> entryNumber = ["No Data Available!"];

  void takeReading() async {
    String? addr = MOISTURESENSOR;
    Uri url = Uri.parse(addr!);

    final response = await http.get(url);
    var jsonResponse = jsonDecode(response.body);
    var feeds = jsonResponse['feeds'];
    int size = feeds.length;

    timestamp.clear();
    entryNumber.clear();
    reading.clear();

    for (int i = size - 1; i >= max(0, size - 10); i--) {
      setState(() {
        timestamp.add(DateTime.parse(feeds[i]['created_at']).toHumanString());
        entryNumber.add(feeds[i]['entry_id'].toString());
        reading.add(feeds[i]['field1'] == 1 ? drySoil : wetSoil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 60, 39),
      appBar: AppBar(
        title: Text(
          "Moisture Sensor",
          style: GoogleFonts.ebGaramond(
              fontWeight: FontWeight.w700,
              fontSize: 30,
              color: Colors.white,
              fontStyle: FontStyle.normal),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                // controller: ScrollController,
                itemCount: reading.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.yellow,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          "Entry Number : ${entryNumber[index]}",
                          style: GoogleFonts.ebGaramond(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Timestamp : ${timestamp[index]}",
                          style: GoogleFonts.ebGaramond(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          reading[index],
                          style: GoogleFonts.ebGaramond(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: takeReading,
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'Refresh',
                style: GoogleFonts.ebGaramond(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
