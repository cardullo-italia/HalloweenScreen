import 'dart:convert';

import 'package:flutter/services.dart';

class FilmExtractData {
  final String nameFilm;
  final String imgFilm;
  final String ratedFilm;

  FilmExtractData(
      {required this.nameFilm, required this.imgFilm, required this.ratedFilm});

  factory FilmExtractData.fromJson(Map<String, dynamic> json) {
    return FilmExtractData(
      nameFilm: json['nameFilm'] ?? '',
      imgFilm: json['imgFilm'] ?? '',
      ratedFilm: json['rates'] ?? '',
    );
  }

  static Future<List<FilmExtractData>> getAllFilm() async {
    var response = await rootBundle.loadString('assets/api/filmJson.json');
     if (response.isNotEmpty) {
      List<dynamic> jsonResponse = jsonDecode(response);
      return jsonResponse
          .map((json) => FilmExtractData.fromJson(json))
          .toList();
    } else {
      return [];
    }
  }
}
