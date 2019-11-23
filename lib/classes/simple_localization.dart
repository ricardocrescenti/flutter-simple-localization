import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class SimpleLocalizations  {
  static T of<T>(BuildContext context, T Function(Locale locale) orDefault) {
    T localization = Localizations.of<T>(context, T);
    return localization ?? orDefault(Localizations.localeOf(context));
  }

  Locale _currentLocale;
  Locale get currentLocale => _currentLocale;

  operator [](dynamic message) => getLocalizedValue(message);

  SimpleLocalizations(Locale locale) {
    _currentLocale = (suportedLocales.contains(locale)
      ? locale
      : defaultLocale);
  }

  Locale get defaultLocale;
  Iterable<Locale> get suportedLocales;

  Map<String, Map<dynamic, String>> get localizedValues;
  
  String getLocalizedValue(dynamic localizedName) {
    return localizedValues[currentLocale.languageCode][localizedName];
  }
}

abstract class BasicLocalizationsDelegate<T extends SimpleLocalizations> extends LocalizationsDelegate<T> {
  final T Function(Locale locale) customLocalization;

  BasicLocalizationsDelegate(this.customLocalization);

  T defaultLocalization(Locale locale);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<T> load(Locale locale) {
    return SynchronousFuture<T>(customLocalization != null 
      ? customLocalization(locale)
      : defaultLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;
}