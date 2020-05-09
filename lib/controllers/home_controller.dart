import 'package:busy_time/models/serie_model.dart';
import 'package:busy_time/repositories/serie_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  SerieRepository _repository;
  SerieModel model;

  _HomeController() {
    _repository = SerieRepository();
  }

  String query = "";

  int _timeWatched = 0;

  @observable
  String timeWatched = "00:00:00";

  @observable
  bool showGrid = true;

  @observable
  bool _removeButton = false;

  @observable
  int seasonNumbers = 0;

  @observable
  int indexSeason = -1;

  @observable
  ObservableList<SerieModel> listContent = ObservableList();

  @action
  getSerie() async {
    if (query != '') {
      var id = await _repository.getIdSerie(query);
      model = await _repository.getSerie(id);
      if (model.id != null) {
        seasonNumbers = model.numberSeasons;
      }
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

  @action
  _calculateTotalTime() {
    int time;
    int episodes = 0;
    if (indexSeason != -1) {
      print("indexSeason CalculateTotalTime: " + indexSeason.toString());
      for (int i = 0; i < indexSeason + 1; i++) {
        episodes += model.episodesForSeason[i];
        print("Episodes: " + episodes.toString());
      }
      print("model.episodeRunTime: " + model.episodeRunTime.toString());
      time = episodes * model.episodeRunTime;
    }
    return time;
  }

  @action
  showSerie() {
    showGrid = false;
    if (model != null) {
      int time = _calculateTotalTime();
      if (time != null) {
        listContent.add(model);
        _updateTimeWatched(time);
      }
    }
    showGrid = true;
  }

  @action
  removeSerie(int index) => listContent.removeAt(index);

  @action
  changeRemoveStatus() => _removeButton = !_removeButton;

  @computed
  bool get showRemoveButton => _removeButton;

  @computed
  double get opacityCard => _removeButton ? 0.4 : 1;
}
