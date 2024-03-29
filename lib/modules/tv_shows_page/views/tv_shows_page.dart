import 'package:f_movie_db/core/utils/paddings.dart';
import 'package:f_movie_db/modules/tv_shows_page/controllers/tv_shows_page_controller.dart';
import 'package:f_movie_db/widgets/futuristic.dart';
import 'package:f_movie_db/widgets/carousell_title.dart';
import 'package:f_movie_db/modules/tv_shows_page/views/tv_shows_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    TvShowsPageController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Paddings.allPaddings),
        child: Column(
          children: [
            Futuristic(
              futureBuilder: () => controller.getData(),
              dataBuilder: (p0, p1) {
                return Column(
                  children: [
                    //TODO: update route
                    InkWell(
                      onTap: () {},
                      child: const CarousellTitle(
                        title: 'Tv Shows On The Air',
                      ),
                    ),
                    TvShowsListView(
                      list: controller.tvShowsOnTheAir,
                      title: 'Tv Shows On The Air',
                    ),
                    InkWell(
                      onTap: () {},
                      child: const CarousellTitle(
                        title: 'Popular Tv Shows',
                      ),
                    ),
                    TvShowsListView(
                      list: controller.tvShowsPopular,
                      title: 'Popular Tv Shows',
                    ),
                    InkWell(
                      onTap: () {},
                      child: const CarousellTitle(
                        title: 'Top Rated Tv Shows',
                      ),
                    ),
                    TvShowsListView(
                      list: controller.tvShowsTopRated,
                      title: 'Top Rated Tv Shows',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
