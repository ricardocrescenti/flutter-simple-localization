import 'dart:ui';
import 'package:simple_localization_example/localizations/example_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {

	const MainApp({Key? key}) : super(key: key);

	@override
	State<StatefulWidget> createState() => _MainAppState();

}

class _MainAppState extends State<MainApp> {

	Locale _locale = window.locale;
	Locale get locale => _locale;

	@override
	Widget build(BuildContext context) {

		return MaterialApp(
			locale: _locale,
			onGenerateTitle: (context) =>
				ExampleLocalizations.of(context)[ExampleLocalizationsEnums.appBarTitle],
			localizationsDelegates: const [
				// ExampleLocalizationsDelegate(),
				GlobalMaterialLocalizations.delegate,
				GlobalCupertinoLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate,
			],
			supportedLocales: const [
				Locale('en', ''),
				Locale('es', ''),
				Locale('pt', ''),
			],
			theme: ThemeData(
				brightness: Brightness.dark,
				primarySwatch: Colors.blue,
			),
			home: Builder(
				builder: buildHome
			),
		);

	}

	Widget buildHome(BuildContext context) {

		return Scaffold(
			appBar: AppBar(
				title: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.appBarTitle]),
				centerTitle: true,
			),
			body: Padding(
				padding: const EdgeInsets.all(20),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Padding(
							padding: const EdgeInsets.only(bottom: 20),
							child: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.bodyTitle], style: Theme.of(context).textTheme.headline3,),
						),
						Padding(
							padding: const EdgeInsets.only(bottom: 20),
							child: Text(ExampleLocalizations.of(context)[ExampleLocalizationsEnums.bodyDescription], style: Theme.of(context).textTheme.headline4, textAlign: TextAlign.center,),
						),
						ElevatedButton(
							style: const ButtonStyle(
								tapTargetSize: MaterialTapTargetSize.padded
							),
							child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.en]),
							onPressed: () => changeLocale(const Locale('en')),
						),
						ElevatedButton(
							style: const ButtonStyle(
								tapTargetSize: MaterialTapTargetSize.padded
							),
							child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.es]),
							onPressed: () => changeLocale(const Locale('es')),
						),
						ElevatedButton(
							style: const ButtonStyle(
								tapTargetSize: MaterialTapTargetSize.padded
							),
							child: Text(ExampleLocalizations.of(context)[ButtonsLocalizationsEnums.pt]),
							onPressed: () => changeLocale(const Locale('pt')),
						),
					],
				),
			),
		);

	}

	void changeLocale(Locale newLocale) {
		setState(() {
			_locale = newLocale;
		});
	}

}

void main() => runApp(const MainApp());
