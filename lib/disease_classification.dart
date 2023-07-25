import 'package:flutter/material.dart';

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
            SizedBox(height: 100,),
            Text("CLASSIFICATION"),
          ],
        ),
      ),
    );
  }
}
