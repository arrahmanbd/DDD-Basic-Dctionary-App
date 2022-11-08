import 'dart:convert';
import 'package:flutter/services.dart';
import '../data/data_model.dart';

Future<List<Words>> fetchWords() async {
  final dataString = await rootBundle.loadString('db.json');
  // Decode to json
  final List<dynamic> json = jsonDecode(dataString);

  // Go through each post and convert json to Post object.
  final allwords = <Words>[];
  json.forEach((v) {
    allwords.add(Words.fromJson(v));
  });
  return allwords;
}
