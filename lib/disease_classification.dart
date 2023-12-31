import 'package:flutter/material.dart';
import 'package:plant_sense_1/image_input.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class DiseaseClassification extends StatefulWidget {
  final String link;
  const DiseaseClassification({
    super.key,
    required this.link,
  });

  @override
  State<DiseaseClassification> createState() => _DiseaseClassificationState();
}

class _DiseaseClassificationState extends State<DiseaseClassification> {
  File? _selectedImage;
  List<dynamic>? classes = ['Image Not Selected'];
  List<dynamic>? scores = ['Please select an Image'];
  String? response;

  String get link {
    return widget.link;
  }

  void infrenceModel() async {
    if (_selectedImage == null) {
      setState(() {
        classes = ['Image Not Selected'];
        scores = ['Please select an Image'];
      });
    } else {
      File file = _selectedImage!;

      String addr = link;

      Uri url = Uri.parse('${addr}api/test');
      String contentType = 'image/jpeg';

      Map<String, String> headers = {'content-type': contentType};

      Uint8List imgBytes = await file.readAsBytes();

      var res = await http.post(url, body: imgBytes, headers: headers);

      var jsonResponse = jsonDecode(res.body);

      if (res.statusCode == 200) {
        setState(() {
          scores = jsonResponse['score'];
          classes = jsonResponse['labels'];
        });
      } else {
        setState(() {
          scores = jsonResponse['Server is '];
          classes = jsonResponse['Down'];
        });
      }
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 60, 39),
      appBar: AppBar(
        title: Text(
          "Disease Classification",
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
            const SizedBox(
              height: 50,
            ),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            FilledButton(
              onPressed: infrenceModel,
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              child: Text(
                'Find Possible Diseases',
                style: GoogleFonts.ebGaramond(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Center(
                    child: Text(
                      classes?[index] + '      ' + scores?[index],
                      style: GoogleFonts.ebGaramond(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  );
                },
                itemCount: classes?.length,
                itemExtent: 50,
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
