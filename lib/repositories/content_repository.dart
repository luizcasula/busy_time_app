import 'package:busy_time/models/content_model.dart';
import 'package:busy_time/utils/key.dart';
import 'package:dio/dio.dart';

class ContentRepository{

  Dio dio = Dio();


  Future<ContentModel> getContent(String query) async{
    ContentModel model;
    Response _response;
    var url = "https://api.themoviedb.org/3/search/multi?api_key=$API_KEY&language=en-US&query=${query.toLowerCase()}&page=1&include_adult=false";
    _response = await dio.get(url);

    print("RESPONSE STATUS CODE:" + _response.statusCode.toString());

    if(_response.statusCode == 200){
      print(_response.data);
      var name = _response.data["results"][0]["name"];

     model = ContentModel(name: name);
     print(model.name);
     return model;
    }else{
      return null;
    }
  }
}