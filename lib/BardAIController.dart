// ignore_for_file: file_names

import 'dart:convert';

import 'package:plant_sense_1/BardModel.dart';
import 'package:plant_sense_1/data.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BardAIController extends GetxController {
  RxList historyList = RxList<bardModel>([]);

  RxBool isLoading = false.obs;
  void sendPrompt(String prompt) async {
    isLoading.value = true;
    var newHistory = bardModel(system: "user", message: prompt);
    historyList.add(newHistory);
    final body = {
      'prompt': {
        'text': prompt,
      },
    };

    final request = await http.post(
      Uri.parse(
          'https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=$APIKEY'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );

    final response = jsonDecode(request.body);
    final bardReplay = response["candidates"][0]["output"];
    var newHistory2 = bardModel(system: "bard", message: bardReplay);
    historyList.add(newHistory2);
    isLoading.value = false;
  }
}
