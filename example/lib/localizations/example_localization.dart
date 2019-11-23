import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simple_localization/simple_localization.dart';

import 'localizations_enums.dart';

class ExampleLocalizations extends SimpleLocalizations {
  static ExampleLocalizations of(BuildContext context) {
    return SimpleLocalizations.of<ExampleLocalizations>(context, (locale) => ExampleLocalizations(locale));
  }

  ExampleLocalizations(Locale locale) : super(locale);

  @override
  Locale get defaultLocale => Locale('en');

  @override
  Iterable<Locale> get suportedLocales => [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  @override
  Map<String, Map<dynamic, String>> get localizedValues => {
    'en': {
      ExampleLocalizationsEnums.appBarTitle: 'Example',
      ExampleLocalizationsEnums.bodyTitle: 'Internationalization',
      ExampleLocalizationsEnums.bodyDescription: 'This package is intended to allow internationalization of your package or application, it is not necessary to add the delegate to the "localizationsDelegates" of "MaterialApp".',
      ButtonsLocalizationsEnums.en: 'Switch to english',
      ButtonsLocalizationsEnums.es: 'Switch to Spanish',
      ButtonsLocalizationsEnums.pt: 'Switch to portuguese',
    },
    'es': {
      ExampleLocalizationsEnums.appBarTitle: 'Ejemplo',
      ExampleLocalizationsEnums.bodyTitle: 'Internacionalizacion',
      ExampleLocalizationsEnums.bodyDescription: 'Este paquete está destinado a permitir la internacionalización de su paquete o aplicación, no es necesario agregar el delegado a las "localizacionesDelegados" de "MaterialApp".',
      ButtonsLocalizationsEnums.en: 'Cambiar al ingles',
      ButtonsLocalizationsEnums.es: 'Cambiar al español',
      ButtonsLocalizationsEnums.pt: 'Cambiar a portugués',
    },
    'pt': {
      ExampleLocalizationsEnums.appBarTitle: 'Exemplo',
      ExampleLocalizationsEnums.bodyTitle: 'Internacionalização',
      ExampleLocalizationsEnums.bodyDescription: 'Este pacote tem por finalidade permitir a internacionalização do seu pacote ou aplicativo, não é necessário adicionar o delegate no "localizationsDelegates" do "MaterialApp".',
      ButtonsLocalizationsEnums.en: 'Mudar para ingles',
      ButtonsLocalizationsEnums.es: 'Mudar para espanhol',
      ButtonsLocalizationsEnums.pt: 'Mudar para portugues',
    },
  };
}