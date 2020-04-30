// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$statusAtom = Atom(name: '_HomeController.status');

  @override
  bool get status {
    _$statusAtom.context.enforceReadPolicy(_$statusAtom);
    _$statusAtom.reportObserved();
    return super.status;
  }

  @override
  set status(bool value) {
    _$statusAtom.context.conditionallyRunInAction(() {
      super.status = value;
      _$statusAtom.reportChanged();
    }, _$statusAtom, name: '${_$statusAtom.name}_set');
  }

  final _$listContentAtom = Atom(name: '_HomeController.listContent');

  @override
  ObservableList<ContentModel> get listContent {
    _$listContentAtom.context.enforceReadPolicy(_$listContentAtom);
    _$listContentAtom.reportObserved();
    return super.listContent;
  }

  @override
  set listContent(ObservableList<ContentModel> value) {
    _$listContentAtom.context.conditionallyRunInAction(() {
      super.listContent = value;
      _$listContentAtom.reportChanged();
    }, _$listContentAtom, name: '${_$listContentAtom.name}_set');
  }

  final _$getContentAsyncAction = AsyncAction('getContent');

  @override
  Future getContent() {
    return _$getContentAsyncAction.run(() => super.getContent());
  }

  @override
  String toString() {
    final string =
        'status: ${status.toString()},listContent: ${listContent.toString()}';
    return '{$string}';
  }
}
