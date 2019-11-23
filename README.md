# simple_localization

Implement `localizations` in your packages and applications simply.

```dart
import 'package:simple_localization/simple_localization.dart';
```

## How to internationalize your app or package

First, I recommend that you declare an enumeration with the message names to make it easier to find messages

```dart
enum WidgetMessages { message1, message2 }
```

Below is an example localization, with the translation of `message1` and` message2` into English, Spanish and Portuguese.

If the application language does not match the supported languages that are declared in `supportedLocales`, the default language entered in` defaultLocale` will be used.

```dart
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
  Map<dynamic, Map<dynamic, String>> get localizedValues => {
    'en': {
      WidgetMessages.message1: 'First message',
      WidgetMessages.message2: 'Second message',
    },
    'es': {
      WidgetMessages.message1: 'Primer mensaje',
      WidgetMessages.message2: 'Segundo mensaje',
    },
    'pt': {
      WidgetMessages.message1: 'Primeira mensagem',
      WidgetMessages.message2: 'Segunda mensagem',
    }
  };
}
```

Below will be shown how to get messages according to app location

```dart
Text(DemoLocalizations.of(context)[WidgetMessages.message1]);
```

It is not necessary to declare localization in `localizationsDelegates` of `MaterialApp`, but it is important that you enter `supportedLocales` to specify the languages supported by your application.

When specifying other locations (other than 'en'), you will need to add in the `supportedLocales` of` MaterialApp` the locations `GlobalMaterialLocalizations.delegate` and` GlobalWidgetsLocalizations.delegate`, missing these locations will generate an application error.

In your `pubspec.yaml` add follow dependencie:

```yaml
  flutter_localizations:
    sdk: flutter
```

And in your `MaterialApp`, add localizations in `supportedLocales`

```dart
MaterialApp(
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
)
```

## Customize package locations

It is often used in package internationalizations, when the developer needs to modify the default messages used in package, for that you need to extend the location of your package, and implement `BasicLocalizationsDelegate`.

First let's create the custom internationalization that will extend the default package location.

```dart
class CustomLocalization extends ExampleLocalizations {
  CustomLocalization(Locale locale) : super(locale);

  @override
  Map<dynamic, Map<dynamic, String>> get customValues => {
    'en': {
      WidgetMessages.message1: 'Custom first message',
      WidgetMessages.message2: 'Custom second message',
    },
    'es': {
      WidgetMessages.message1: 'Primer mensaje personalizado',
      WidgetMessages.message2: 'Segundo mensaje personalizado',
    },
    'pt': {
      WidgetMessages.message1: 'Primeira mensagem personalizada',
      WidgetMessages.message2: 'Segunda mensagem personalizada',
    }
  };
}
```

Now let's create the `BasicLocalizationsDelegate` class to define the custom class to be loaded by the application.

```
class CustomLocalizationsDelegate extends BasicLocalizationsDelegate<ExampleLocalizations> {
  @override
  customLocalization(Locale locale) => CustomLocalization(locale);
}
```

And finally, inform the delegate in `localizationsDelegates` of your apps `MaterialApp`.

```dart
MaterialApp(
  localizationsDelegates: [
    CustomLocalizationsDelegate(),
  ],
)
```