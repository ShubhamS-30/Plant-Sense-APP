// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';
String? APIKEY = dotenv.env['APIKEY'];
const String BaseURL =
    "https://generativelanguage.googleapis.com/v1beta2/models/text-bison-001:generateText?key=YOUR_API_KEY";
