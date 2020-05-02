import 'package:busy_time/models/serie_model.dart';
import 'package:busy_time/utils/key.dart';
import 'package:dio/dio.dart';

class SerieRepository {
  Dio dio = Dio();

  Future<SerieModel> getContent(String query) async {
    SerieModel model;
    Response _response;
    var url =
        "https://api.themoviedb.org/3/search/multi?api_key=$API_KEY&language=en-US&query=${query.toLowerCase()}&page=1&include_adult=false";
    _response = await dio.get(url);

    print("RESPONSE STATUS CODE:" + _response.statusCode.toString());

    if (_response.statusCode == 200) {
      print(_response.data);
      var name = _response.data["results"][0]["name"];
      var posterPath = "https://image.tmdb.org/t/p/original/" +
          _response.data["results"][0]["poster_path"];
      model = SerieModel(name: name, posterPath: posterPath);
      print(model.name);
      return model;
    } else {
      return null;
    }
  }
}
