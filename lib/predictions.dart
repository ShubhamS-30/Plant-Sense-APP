import 'package:flutter/material.dart';
// import 'package:plant_sense_1/image_input.dart';

class GetPredictions extends StatefulWidget {
  const GetPredictions({super.key});

  @override
  State<GetPredictions> createState() => _GetPredictionsState();
}

class _GetPredictionsState extends State<GetPredictions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(backgroundColor: Colors.green),
          child: const Text(
            'Get Predictions !!',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
