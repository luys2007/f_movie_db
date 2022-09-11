import 'package:dio/dio.dart';
import 'package:f_movie_db/core/utils/base_url.dart';
import 'package:f_movie_db/data/model/results.dart';
import 'package:f_movie_db/globals/api_secrets.dart';

class MoviesClient {
  final Dio httpClient;
  final String endPoint;
  final int page;
  MoviesClient({
    required this.httpClient,
    required this.endPoint,
    this.page = 1,
  });

  getAll() async {
    try {
      var response = await httpClient.get(
        baseURL + endPoint,
        queryParameters: {
          'api_key': apiKey,
          'page': page,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = response.data;
        List<Results> listMovies = jsonResponse['results'].map<Results>((map) {
          return Results.fromJson(map);
        }).toList();
        return listMovies;
      }
    } catch (e) {}
  }
}