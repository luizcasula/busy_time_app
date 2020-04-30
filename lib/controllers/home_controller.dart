
import 'package:busy_time/models/content_model.dart';
import 'package:busy_time/repositories/content_repository.dart';

import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  
  _HomeController(){
    _repository = ContentRepository();
  }
  //String name = '';
  @observalble
  bool status = true;

  List<ContentModel> listContent = List();

  ContentRepository _repository;
  
    
  
  @action
  getContent(String query) async {
    //status = false;
    ContentModel model = await _repository.getContent(query);
    listContent.add(model);
    //status = true;
  }


}