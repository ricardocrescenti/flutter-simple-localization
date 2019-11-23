import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:module_provider/module_provider.dart';

import 'app_page.dart';
import 'app_service.dart';

class AppModule extends Module {
  @override
  List<Inject<Service>> get services => [
    Inject((m, arg) => AppService(m))
  ];

  @override
  Widget build(BuildContext context) {
    return ServiceConsumer<AppService>(
      builder: (context, service) => MaterialApp(
        locale: service.locale,
        supportedLocales: [
          Locale('en'),
          Locale('es'),
          Locale('pt'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Example Localization',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ),
        home: AppPage(),
      ),
    );
  }
}