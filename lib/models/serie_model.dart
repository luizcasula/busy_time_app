class SerieModel {
  int _id;
  String _name;
  String _posterPath;
  int _numberSeasons;
  int _episodeRunTime;
  List<int> _episodesForSeason;

  SerieModel(
      {
      int id,
      String name,
      int numberSeasons,
      String posterPath,
      String backdropPath,
      int episodeRunTime,
      List<int> episodesForSeason}) {
    this._id = id;
    this._name = name;
    this._posterPath = posterPath;
    this._episodeRunTime = episodeRunTime;
    this._numberSeasons = numberSeasons;
    this._episodesForSeason = episodesForSeason;
  }

  List<int> get episodesForSeason => _episodesForSeason;
  set episodesForSeason(List<int> episodesForSeason) => _episodesForSeason;

  int get numberSeasons => _numberSeasons;
  set numberSeasons(int numberSeasons) => _numberSeasons;

  int get episodeRunTime => _episodeRunTime;
  set episodeRunTime(int episodeRunTime) => _episodeRunTime;

  int get id => _id;
  set id(int id) => _id = id;

  String get name => _name;
  set name(String name) => _name = name;

  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
}
