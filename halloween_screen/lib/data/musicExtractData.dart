import 'dart:convert';

import 'package:flutter/services.dart';

class MusicExtractData {
  final String nameMusic;
  final String imgMusic;

  MusicExtractData({required this.nameMusic, required this.imgMusic});

  factory MusicExtractData.fromJson(Map<String, dynamic> json) {
    return MusicExtractData(
        nameMusic: json['nameMusic'], imgMusic: json['imgMusic']);
  }

  static Future<List<MusicExtractData>> getAllMusic() async {
    var response = await rootBundle.loadString('assets/api/musicJson.json');
    if (response.isNotEmpty) {
      List<dynamic> jsonResponse = jsonDecode(response);
      return jsonResponse
          .map((json) => MusicExtractData.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }
}
