import 'package:busy_time/models/serie_model.dart';
import 'package:busy_time/utils/key.dart';
import 'package:dio/dio.dart';

class SerieRepository {
  Dio dio = Dio();

  Future<SerieModel> getSerie(String query) async {
    SerieModel model;
    Response _response;
    var url =
        "https://api.themoviedb.org/3/search/tv?api_key=$API_KEY&query=${query.toLowerCase()}&page=1&include_adult=false";
    _response = await dio.get(url);

    print("RESPONSE STATUS CODE:" + _response.statusCode.toString());

    if (_response.statusCode == 200) {
      print(_response.data);
      var name = _response.data["results"][0]["name"];
      var posterPath = "https://image.tmdb.org/t/p/original/" +
          _response.data["results"][0]["poster_path"];
      var id = _response.data["results"][0]["id"];
      
      url = "https://api.themoviedb.org/3/tv/$id?api_key=$API_KEY";
      _response = await dio.get(url);
      
      if (_response.statusCode == 200) {
        print(_response.data.toString());
        var episodeRunTime = _response.data["episode_run_time"][0];
        print("episode_run_time: " + episodeRunTime.toString());

        model = SerieModel(
            id: id,
            name: name,
            posterPath: posterPath,
            episodeRunTime: episodeRunTime);

        print(model.name);
        return model;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
