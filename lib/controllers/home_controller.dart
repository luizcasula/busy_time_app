import 'package:busy_time/models/serie_model.dart';
import 'package:busy_time/repositories/serie_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  SerieRepository _repository;

  _HomeController() {
    _repository = SerieRepository();
  }

  String query = "";

  @observable
  bool status = true;

  @observable
  ObservableList<SerieModel> listContent = ObservableList();


  @action
  getContent() async {
    if (query != '') {
      status = false;
      SerieModel model = await _repository.getContent(query);
      if (model != null) {
        listContent.add(model);
      }
      status = true;
    }
  }
}
