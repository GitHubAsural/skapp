// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Global on GlobalMobx, Store {
  Computed<Brightness> _$themeModeComputed;

  @override
  Brightness get themeMode =>
      (_$themeModeComputed ??= Computed<Brightness>(() => super.themeMode,
              name: 'GlobalMobx.themeMode'))
          .value;
  Computed<int> _$imageCasheSizeComputed;

  @override
  int get imageCasheSize =>
      (_$imageCasheSizeComputed ??= Computed<int>(() => super.imageCasheSize,
              name: 'GlobalMobx.imageCasheSize'))
          .value;

  final _$showAdAtom = Atom(name: 'GlobalMobx.showAd');

  @override
  bool get showAd {
    _$showAdAtom.reportRead();
    return super.showAd;
  }

  @override
  set showAd(bool value) {
    _$showAdAtom.reportWrite(value, super.showAd, () {
      super.showAd = value;
    });
  }

  final _$updataAppAtom = Atom(name: 'GlobalMobx.updataApp');

  @override
  bool get updataApp {
    _$updataAppAtom.reportRead();
    return super.updataApp;
  }

  @override
  set updataApp(bool value) {
    _$updataAppAtom.reportWrite(value, super.updataApp, () {
      super.updataApp = value;
    });
  }

  final _$isAllowProtocolAtom = Atom(name: 'GlobalMobx.isAllowProtocol');

  @override
  bool get isAllowProtocol {
    _$isAllowProtocolAtom.reportRead();
    return super.isAllowProtocol;
  }

  @override
  set isAllowProtocol(bool value) {
    _$isAllowProtocolAtom.reportWrite(value, super.isAllowProtocol, () {
      super.isAllowProtocol = value;
    });
  }

  final _$appConfigAtom = Atom(name: 'GlobalMobx.appConfig');

  @override
  dynamic get appConfig {
    _$appConfigAtom.reportRead();
    return super.appConfig;
  }

  @override
  set appConfig(dynamic value) {
    _$appConfigAtom.reportWrite(value, super.appConfig, () {
      super.appConfig = value;
    });
  }

  final _$appAdsAtom = Atom(name: 'GlobalMobx.appAds');

  @override
  AppAdsDao get appAds {
    _$appAdsAtom.reportRead();
    return super.appAds;
  }

  @override
  set appAds(AppAdsDao value) {
    _$appAdsAtom.reportWrite(value, super.appAds, () {
      super.appAds = value;
    });
  }

  final _$titleAtom = Atom(name: 'GlobalMobx.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$themeAtom = Atom(name: 'GlobalMobx.theme');

  @override
  Color get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(Color value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$isDarkAtom = Atom(name: 'GlobalMobx.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  final _$showPauseAtom = Atom(name: 'GlobalMobx.showPause');

  @override
  bool get showPause {
    _$showPauseAtom.reportRead();
    return super.showPause;
  }

  @override
  set showPause(bool value) {
    _$showPauseAtom.reportWrite(value, super.showPause, () {
      super.showPause = value;
    });
  }

  final _$isShowListAtom = Atom(name: 'GlobalMobx.isShowList');

  @override
  bool get isShowList {
    _$isShowListAtom.reportRead();
    return super.isShowList;
  }

  @override
  set isShowList(bool value) {
    _$isShowListAtom.reportWrite(value, super.isShowList, () {
      super.isShowList = value;
    });
  }

  final _$getAppConfigAsyncAction = AsyncAction('GlobalMobx.getAppConfig');

  @override
  Future<dynamic> getAppConfig() {
    return _$getAppConfigAsyncAction.run(() => super.getAppConfig());
  }

  final _$getAppAdsAsyncAction = AsyncAction('GlobalMobx.getAppAds');

  @override
  Future<dynamic> getAppAds() {
    return _$getAppAdsAsyncAction.run(() => super.getAppAds());
  }

  final _$GlobalMobxActionController = ActionController(name: 'GlobalMobx');

  @override
  void changeShowAd(bool showAd) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeShowAd');
    try {
      return super.changeShowAd(showAd);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeShowList(bool b) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeShowList');
    try {
      return super.changeShowList(b);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeTheme(Color color) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeTheme');
    try {
      return super.changeTheme(color);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeThemeMode(bool value) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeThemeMode');
    try {
      return super.changeThemeMode(value);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeProtocol(bool value) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeProtocol');
    try {
      return super.changeProtocol(value);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeUpdataApp() {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeUpdataApp');
    try {
      return super.changeUpdataApp();
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAppAdsPause(bool v) {
    final _$actionInfo = _$GlobalMobxActionController.startAction(
        name: 'GlobalMobx.changeAppAdsPause');
    try {
      return super.changeAppAdsPause(v);
    } finally {
      _$GlobalMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showAd: ${showAd},
updataApp: ${updataApp},
isAllowProtocol: ${isAllowProtocol},
appConfig: ${appConfig},
appAds: ${appAds},
title: ${title},
theme: ${theme},
isDark: ${isDark},
showPause: ${showPause},
isShowList: ${isShowList},
themeMode: ${themeMode},
imageCasheSize: ${imageCasheSize}
    ''';
  }
}
