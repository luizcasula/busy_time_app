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

  int _timeWatched = 0;

  @observable
  String timeWatched = "00:00:00";

  @observable
  bool status = true;

  @observable
  ObservableList<SerieModel> listContent = ObservableList();

  @action
  getContent() async {
    if (query != '') {
      status = false;
      SerieModel model = await _repository.getSerie(query);
      if (model != null) {
        listContent.add(model);
        _updateTimeWatched(model.episodeRunTime);
      }
      status = true;
    }
  }

  @action
  _updateTimeWatched(int time) {
    _timeWatched += time;
    Duration d = Duration(minutes: _timeWatched);
    timeWatched = "${d.inDays}:" +
        d.inHours.remainder(24).toString().padLeft(2, '0') +
        ":" +
        d.inMinutes.remainder(60).toString().padLeft(2, '0');
  }
}
