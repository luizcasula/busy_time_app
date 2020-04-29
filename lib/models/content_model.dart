class ContentModel {
  String _originalName;
  int _id;
  String _mediaType;
  String _name;
  double _popularity;
  int _voteCount;
  int _voteAverage;
  String _firstAirDate;
  String _posterPath;
  List<int> _genreIds;
  String _originalLanguage;
  String _backdropPath;
  String _overview;
  List<String> _originCountry;

  ContentModel(
      {String originalName,
      int id,
      String mediaType,
      String name,
      double popularity,
      int voteCount,
      int voteAverage,
      String firstAirDate,
      String posterPath,
      List<int> genreIds,
      String originalLanguage,
      String backdropPath,
      String overview,
      List<String> originCountry}) {
    this._originalName = originalName;
    this._id = id;
    this._mediaType = mediaType;
    this._name = name;
    this._popularity = popularity;
    this._voteCount = voteCount;
    this._voteAverage = voteAverage;
    this._firstAirDate = firstAirDate;
    this._posterPath = posterPath;
    this._genreIds = genreIds;
    this._originalLanguage = originalLanguage;
    this._backdropPath = backdropPath;
    this._overview = overview;
    this._originCountry = originCountry;
  }

  String get originalName => _originalName;
  set originalName(String originalName) => _originalName = originalName;
  int get id => _id;
  set id(int id) => _id = id;
  String get mediaType => _mediaType;
  set mediaType(String mediaType) => _mediaType = mediaType;
  String get name => _name;
  set name(String name) => _name = name;
  double get popularity => _popularity;
  set popularity(double popularity) => _popularity = popularity;
  int get voteCount => _voteCount;
  set voteCount(int voteCount) => _voteCount = voteCount;
  int get voteAverage => _voteAverage;
  set voteAverage(int voteAverage) => _voteAverage = voteAverage;
  String get firstAirDate => _firstAirDate;
  set firstAirDate(String firstAirDate) => _firstAirDate = firstAirDate;
  String get posterPath => _posterPath;
  set posterPath(String posterPath) => _posterPath = posterPath;
  List<int> get genreIds => _genreIds;
  set genreIds(List<int> genreIds) => _genreIds = genreIds;
  String get originalLanguage => _originalLanguage;
  set originalLanguage(String originalLanguage) =>
      _originalLanguage = originalLanguage;
  String get backdropPath => _backdropPath;
  set backdropPath(String backdropPath) => _backdropPath = backdropPath;
  String get overview => _overview;
  set overview(String overview) => _overview = overview;
  List<String> get originCountry => _originCountry;
  set originCountry(List<String> originCountry) =>
      _originCountry = originCountry;

  ContentModel.fromJson(Map<String, dynamic> json) {
    _originalName = json['original_name'];
    _id = json['id'];
    _mediaType = json['media_type'];
    _name = json['name'];
    _popularity = json['popularity'];
    _voteCount = json['vote_count'];
    _voteAverage = json['vote_average'];
    _firstAirDate = json['first_air_date'];
    _posterPath = json['poster_path'];
    _genreIds = json['genre_ids'].cast<int>();
    _originalLanguage = json['original_language'];
    _backdropPath = json['backdrop_path'];
    _overview = json['overview'];
    _originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_name'] = this._originalName;
    data['id'] = this._id;
    data['media_type'] = this._mediaType;
    data['name'] = this._name;
    data['popularity'] = this._popularity;
    data['vote_count'] = this._voteCount;
    data['vote_average'] = this._voteAverage;
    data['first_air_date'] = this._firstAirDate;
    data['poster_path'] = this._posterPath;
    data['genre_ids'] = this._genreIds;
    data['original_language'] = this._originalLanguage;
    data['backdrop_path'] = this._backdropPath;
    data['overview'] = this._overview;
    data['origin_country'] = this._originCountry;
    return data;
  }
}
