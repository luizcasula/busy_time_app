class SerieModel {
  String _originalName;
  int _id;
  String _name;
  String _posterPath;
  String _originalLanguage;
  String _backdropPath;
  int _numberSeasons;
  int _episodeRunTime;
  List<int> _episodesForSeason;

  SerieModel(
      {String originalName,
      int id,
      String name,
      int numberSeasons,
      String posterPath,
      String backdropPath,
      int episodeRunTime,
      List<int> episodesForSeason}) {
    this._originalName = originalName;
    this._id = id;
    this._name = name;
    this._posterPath = posterPath;
    this._originalLanguage = originalLanguage;
    this._backdropPath = backdropPath;
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

  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
}
