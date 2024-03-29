import 'package:f_movie_db/data/model/person_movies_credits/person_movies_credits.dart';
import 'package:f_movie_db/data/model/person_tv_shows_credits/person_tv_shows_credits.dart';
import 'package:f_movie_db/data/services/person_tv_shows_credits_client.dart';
import 'package:get/get.dart';

class PersonTvShowsCreditsController extends GetxController {
  final PersonTvShowsCreditsClient client;
  PersonTvShowsCreditsController(this.client);

  Future<PersonTvShowsCredits> getData(personId) async {
    client.id = personId;
    return await client.getData();
  }
}
