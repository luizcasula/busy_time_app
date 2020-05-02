import 'package:busy_time/models/serie_model.dart';
import 'package:busy_time/utils/key.dart';
import 'package:dio/dio.dart';

class SerieRepository {
  Dio dio = Dio();

  Future<int> getIdSerie(String query) async {
    Response _response;
    var url =
        "https://api.themoviedb.org/3/search/tv?api_key=$API_KEY&query=${query.toLowerCase()}&page=1&include_adult=false";
    _response = await dio.get(url);

    print("RESPONSE STATUS CODE:" + _response.statusCode.toString());

    if (_response.statusCode == 200) {
      print(_response.data);
      return _response.data["results"][0]["id"];
    } else {
      return null;
    }
  }

  Future<SerieModel> getSerie(int id) async {
    Response _response;
    SerieModel model;

    var url = "https://api.themoviedb.org/3/tv/$id?api_key=$API_KEY";

    _response = await dio.get(url);

    if (_response.statusCode == 200) {
      print(_response.data.toString());
      var id = _response.data["id"];
      var name = _response.data["name"];
      var episodeRunTime = _response.data["episode_run_time"][0];
      var numberSeasons = _response.data["number_of_seasons"];
      var posterPath = "https://image.tmdb.org/t/p/original/" +
          _response.data["poster_path"];
      print("episode_run_time: " + episodeRunTime.toString());
      
      List<int> episodesForSeason = [];

      var seasons = _response.data["seasons"];
      
      for(var season in seasons){
        episodesForSeason.add(season["episode_count"]);
        print(episodesForSeason.toString());
      }

      model = SerieModel(
        id: id,
        name: name,
        numberSeasons: numberSeasons,
        episodeRunTime: episodeRunTime,
        posterPath: posterPath,
        episodesForSeason: episodesForSeason
      );

      print(model.name);

      return model;
    } else {
      return null;
    }
  }
}
