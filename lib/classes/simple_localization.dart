import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Class to implement localizations in your packages and applications simply.
abstract class SimpleLocalizations {
  
  /// Get current location
  static T of<T>(BuildContext context, T Function(Locale locale) orDefault) {
    T localization = Localizations.of<T>(context, T);
    return localization ?? orDefault(Localizations.localeOf(context));
  }

  /// Current location loaded
  Locale _currentLocale;
  Locale get currentLocale => _currentLocale;

  /// Operator to get message to use
  String operator [](dynamic message) => getLocalizedValue(message);

  SimpleLocalizations(Locale locale) {
    _currentLocale = (suportedLocales.contains(locale) ? locale : defaultLocale);
  }

  /// If your device location is not supported, this will be the default
  /// location to use
  Locale get defaultLocale;

  /// Locations supported by your app
  Iterable<Locale> get suportedLocales;

  /// Message values to be used by your app for all supported locations.
  Map<String, Map<dynamic, String>> get localizedValues;

  /// Custom values, used to modify certain values, this property should only
  /// be used in custom package locations that use internationalization.
  Map<String, Map<dynamic, String>> get customValues => null;

  /// Operator to get message to use
  String getLocalizedValue(dynamic localizedName) {
    if (customValues != null && customValues.containsKey(currentLocale.languageCode) && customValues[currentLocale.languageCode].containsKey(localizedName)) {
      return customValues[currentLocale.languageCode][localizedName];
    }
    return localizedValues[currentLocale.languageCode][localizedName];
  }
}

/// Delegate used if internationalization needs to be customized, it is often
/// used in package internationalizations, when the developer needs to modify the default messages, for that you need to extend the location of your package, and return to custom locations in the `customLocalization` method.
abstract class SimpleLocalizationsDelegate<T extends SimpleLocalizations> extends LocalizationsDelegate<T> {
  T Function(Locale locale) customLocalization;

  SimpleLocalizationsDelegate(this.customLocalization);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<T> load(Locale locale) {
    return SynchronousFuture<T>(customLocalization(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;
}
