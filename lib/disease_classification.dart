import 'package:flutter/material.dart';
import 'package:plant_sense_1/image_input.dart';
import 'dart:io';

class DiseaseClassification extends StatefulWidget {
  const DiseaseClassification({super.key});

  @override
  State<DiseaseClassification> createState() => _DiseaseClassificationState();
}

class _DiseaseClassificationState extends State<DiseaseClassification> {
  File? _selectedImage;
  String? predictions;
  void test() {
    if (_selectedImage == null) {
      print('image not found');
    } else {
      print('Image Exists');
    }
  }



  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 127, 60, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "DISEASE CLASSIFICATION",
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),

            const SizedBox(
              height: 30,
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
              onPressed: test,
              style: FilledButton.styleFrom(backgroundColor: Colors.green),
              child: const Text(
                'Check',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
