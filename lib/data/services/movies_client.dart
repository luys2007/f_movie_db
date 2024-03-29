import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f_movie_db/core/const.dart';
import 'package:f_movie_db/data/model/movies_results.dart';
import 'package:f_movie_db/core/utils/api_key.dart';
import 'package:flutter/material.dart';

class MoviesClient {
  final Dio httpClient;
  String? endPoint;
  final int page;
  MoviesClient({
    required this.httpClient,
    this.endPoint,
    this.page = 1,
  });

  Future getData() async {
    try {
      var response = await httpClient.get(
        baseURL + endPoint!,
        queryParameters: {
          'api_key': apiKey,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<MoviesResults> listMovies =
            jsonResponse['results'].map<MoviesResults>((map) {
          return MoviesResults.fromJson(map);
        }).toList();
        return listMovies;
      } else {
        throw HttpException(
            'Code: ${response.statusCode} \nMessage: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      debugPrint('Dio: ${e.message}');
    } on HttpException catch (e) {
      debugPrint(e.message);
    }
  }
}
