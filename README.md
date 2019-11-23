# simple_localization

Implement `localizations` in your packages and applications simply.

```dart
import 'package:simple_localization/simple_localization.dart';
```

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

### How to configure localizations

In your `pubspec.yaml` add follow dependencie:

```yaml
  flutter_localizations:
    sdk: flutter
```

And in your `MaterialApp`, add localizations in `supportedLocales`

```dart
GlobalMaterialLocalizations.delegate,
GlobalWidgetsLocalizations.delegate,
```