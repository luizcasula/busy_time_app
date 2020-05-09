// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  Computed<bool> _$showRemoveButtonComputed;

  @override
  bool get showRemoveButton => (_$showRemoveButtonComputed ??=
          Computed<bool>(() => super.showRemoveButton))
      .value;
  Computed<double> _$opacityCardComputed;

  @override
  double get opacityCard =>
      (_$opacityCardComputed ??= Computed<double>(() => super.opacityCard))
          .value;

  final _$timeWatchedAtom = Atom(name: '_HomeController.timeWatched');

  @override
  String get timeWatched {
    _$timeWatchedAtom.context.enforceReadPolicy(_$timeWatchedAtom);
    _$timeWatchedAtom.reportObserved();
    return super.timeWatched;
  }

  @override
  set timeWatched(String value) {
    _$timeWatchedAtom.context.conditionallyRunInAction(() {
      super.timeWatched = value;
      _$timeWatchedAtom.reportChanged();
    }, _$timeWatchedAtom, name: '${_$timeWatchedAtom.name}_set');
  }

  final _$showGridAtom = Atom(name: '_HomeController.showGrid');

  @override
  bool get showGrid {
    _$showGridAtom.context.enforceReadPolicy(_$showGridAtom);
    _$showGridAtom.reportObserved();
    return super.showGrid;
  }

  @override
  set showGrid(bool value) {
    _$showGridAtom.context.conditionallyRunInAction(() {
      super.showGrid = value;
      _$showGridAtom.reportChanged();
    }, _$showGridAtom, name: '${_$showGridAtom.name}_set');
  }

  final _$_removeButtonAtom = Atom(name: '_HomeController._removeButton');

  @override
  bool get _removeButton {
    _$_removeButtonAtom.context.enforceReadPolicy(_$_removeButtonAtom);
    _$_removeButtonAtom.reportObserved();
    return super._removeButton;
  }

  @override
  set _removeButton(bool value) {
    _$_removeButtonAtom.context.conditionallyRunInAction(() {
      super._removeButton = value;
      _$_removeButtonAtom.reportChanged();
    }, _$_removeButtonAtom, name: '${_$_removeButtonAtom.name}_set');
  }

  final _$seasonNumbersAtom = Atom(name: '_HomeController.seasonNumbers');

  @override
  int get seasonNumbers {
    _$seasonNumbersAtom.context.enforceReadPolicy(_$seasonNumbersAtom);
    _$seasonNumbersAtom.reportObserved();
    return super.seasonNumbers;
  }

  @override
  set seasonNumbers(int value) {
    _$seasonNumbersAtom.context.conditionallyRunInAction(() {
      super.seasonNumbers = value;
      _$seasonNumbersAtom.reportChanged();
    }, _$seasonNumbersAtom, name: '${_$seasonNumbersAtom.name}_set');
  }

  final _$indexSeasonAtom = Atom(name: '_HomeController.indexSeason');

  @override
  int get indexSeason {
    _$indexSeasonAtom.context.enforceReadPolicy(_$indexSeasonAtom);
    _$indexSeasonAtom.reportObserved();
    return super.indexSeason;
  }

  @override
  set indexSeason(int value) {
    _$indexSeasonAtom.context.conditionallyRunInAction(() {
      super.indexSeason = value;
      _$indexSeasonAtom.reportChanged();
    }, _$indexSeasonAtom, name: '${_$indexSeasonAtom.name}_set');
  }

  final _$listContentAtom = Atom(name: '_HomeController.listContent');

  @override
  ObservableList<SerieModel> get listContent {
    _$listContentAtom.context.enforceReadPolicy(_$listContentAtom);
    _$listContentAtom.reportObserved();
    return super.listContent;
  }

  @override
  set listContent(ObservableList<SerieModel> value) {
    _$listContentAtom.context.conditionallyRunInAction(() {
      super.listContent = value;
      _$listContentAtom.reportChanged();
    }, _$listContentAtom, name: '${_$listContentAtom.name}_set');
  }

  final _$getSerieAsyncAction = AsyncAction('getSerie');

  @override
  Future getSerie() {
    return _$getSerieAsyncAction.run(() => super.getSerie());
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic _updateTimeWatched(int time) {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super._updateTimeWatched(time);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _calculateTotalTime() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super._calculateTotalTime();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic showSerie() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.showSerie();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSerie(int index) {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.removeSerie(index);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRemoveStatus() {
    final _$actionInfo = _$_HomeControllerActionController.startAction();
    try {
      return super.changeRemoveStatus();
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'timeWatched: ${timeWatched.toString()},showGrid: ${showGrid.toString()},seasonNumbers: ${seasonNumbers.toString()},indexSeason: ${indexSeason.toString()},listContent: ${listContent.toString()},showRemoveButton: ${showRemoveButton.toString()},opacityCard: ${opacityCard.toString()}';
    return '{$string}';
  }
}
