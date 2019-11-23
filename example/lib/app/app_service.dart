import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:module_provider/module_provider.dart';

class AppService extends Service{
  Locale _locale;
  Locale get locale => _locale;

  AppService(Module module) : super(module) {
    this._locale = Locale(window.locale.languageCode);
  }

  changeLocale(Locale newLocale) {
    this._locale = newLocale;
    notifyListeners();
  }
}