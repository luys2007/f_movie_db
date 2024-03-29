import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_cast.dart';
import 'package:f_movie_db/data/model/tv_shows_credits.dart/tv_shows_credits_crew.dart';
import 'package:f_movie_db/data/model/video_results.dart';
import 'package:f_movie_db/data/services/tv_shows_credits_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsCreditsController extends GetxController {
  final TvShowsCreditsClient client;
  TvShowsCreditsController(this.client);

  Future getData(tvShowId) async {
    client.id = tvShowId;
    try {
      return await client.getData();
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }
}
