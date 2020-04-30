import 'package:busy_time/models/content_model.dart';
import 'package:busy_time/repositories/content_repository.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  ContentRepository _repository;

  _HomeController() {
    _repository = ContentRepository();
  }

  String query = "";

  @observable
  bool status = true;

  @observable
  ObservableList<ContentModel> listContent = ObservableList();


  @action
  getContent() async {
    if (query != '') {
      status = false;
      ContentModel model = await _repository.getContent(query);
      if (model != null) {
        listContent.add(model);
      }
      status = true;
    }
  }
}
