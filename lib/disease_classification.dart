import 'package:flutter/material.dart';
import 'package:plant_sense_1/image_input.dart';
import 'package:plant_sense_1/predictions.dart';
class DiseaseClassification extends StatefulWidget {
  const DiseaseClassification({super.key});

  @override
  State<DiseaseClassification> createState() => _DiseaseClassificationState();
}

class _DiseaseClassificationState extends State<DiseaseClassification> {
  @override
  Widget build(context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 60, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Text(
              "DISEASE CLASSIFICATION",
              style: TextStyle(color: Colors.green, fontSize: 30),
            ),
            // const SizedBox(
            //   height: 200,
            // ),
            // FilledButton(
            //   onPressed: () {},
            //   style: FilledButton.styleFrom(backgroundColor: Colors.green),
            //   child: const Text('Take a Picture',style: TextStyle(fontSize: 25),),
            // ),
            SizedBox(height: 30,),
            ImageInput(),
            SizedBox(height: 40,),
            GetPredictions(),
          ],
        ),
      ),
    );
  }
}
