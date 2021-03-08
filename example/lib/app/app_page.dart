import 'package:example_localization/localizations/example_localization.dart';
import 'package:example_localization/localizations/localizations_enums.dart';
import 'package:flutter/material.dart';
import 'package:module_provider/module_provider.dart';

import 'app_service.dart';

class AppPage extends Component {
  @override
  Widget build(BuildContext context, Module module, Controller controller) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.appBarTitle]),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.bodyTitle], style: Theme.of(context).textTheme.headline3,),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.bodyDescription], style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
            ),
            ElevatedButton(
              child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.en]),
              onPressed: () => module.service<AppService>().changeLocale(Locale('en')),
            ),
            ElevatedButton(
              child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.es]),
              onPressed: () => module.service<AppService>().changeLocale(Locale('es')),
            ),
            ElevatedButton(
              child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.pt]),
              onPressed: () => module.service<AppService>().changeLocale(Locale('pt')),
            ),
          ],
        ),
      ),
    );
  }
}