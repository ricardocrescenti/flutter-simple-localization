# Simple Localization

Easily internationalize your package or application.

- **[Introduction](#introduction)**
- **[How to Install](#how-to-install)**
- **[How to Implement](#how-to-implement)**
- **[Internationalize a Package](#internationalize-a-package)**
- **[Customizing internationalized packages](#customizing-internationalized-packages)**

## Introduction

This package simplifies the internationalization of your package or application.

## How to Install

Add the dependency on `pubspec.yaml`. 

*Informing `^` at the beginning of the version, you will receive all updates that are made from version `1.0.0` up to the version before `2.0.0`.*

```yaml
dependencies:
  simple_localization: ^1.2.0
```

Import the package in the source code.

```dart
import 'package:simple_localization/simple_localization.dart';
```

## How to Implement

To start the internationalization of your application or package, create a class with inheritance from `SimpleLocalizations`.

I recommend that you declare an enumerate with the names of the messages, you do not need to use an enumeration, you can use the type of your preference, however the use of enumerations facilitates the location of the places that are used a certain message.

Below is an example of the class.

```dart
/// Enumerated with the names of the messages that will be used
enum WidgetMessages { message1, message2 }

/// Internationalization class.
class ExampleLocalizations extends SimpleLocalizations {
  
  /// Declaring the `of` method to get the message in the current language.
  static ExampleLocalizations of(BuildContext context) {
    return SimpleLocalizations.of<ExampleLocalizations>(context, (locale) => ExampleLocalizations(locale));
  }

  /// Standard constructor.
  ExampleLocalizations(Locale locale) : super(locale);

  /// Default locale to use when the device language is not in the list of supported languages.
  @override
  Locale get defaultLocale => Locale('en');

  /// List of supported languages.
  @override
  Iterable<Locale> get suportedLocales => [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// Language declaration with messages in their respective languages
  @override
  Map<String, Map<dynamic, String>> get localizedValues => {
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

Below is an example of how to get the message according to the current language.

```dart
Text(ExampleLocalizations.of(context)[WidgetMessages.message1]);
```

In the application that is being internationalized, or an application that uses an internationalized package, the languages ​​supported must be informed in the `supportedLocales` property of `MaterialApp`.

See an example of implementation below.

```dart
MaterialApp(
  supportedLocales: [
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ],
)
```

## Internationalize a Package

These implementations are only necessary if you want to allow applications that use your package to modify messages.

To internationalize your package, you will first need to create the internationalization class, as explained above, after you will need to create an additional class to allow the application that uses your package to modify the default messages.

See below how to implement the class.

*The name of this class by default will be the name of the internationalization class concatenated with the text 'Delegate', and can be in the same file that has the implementation of the internationalization class.*

```dart
class ExampleLocalizationsDelegate extends SimpleLocalizationsDelegate<ExampleLocalizations> {
  ExampleLocalizationsDelegate(ExampleLocalizations Function(Locale locale) customLocalization) : super(customLocalization);
}
```

When releasing your package for other applications to modify the internationalization messages, you should export the internationalization classes, as this example would be the `ExampleLocalizations` and` ExampleLocalizationsDelegate` classes.

## Customizing internationalized packages

In this section you will see how to customize the internationalization of a package that has internationalization with the `simple_localization` package.

Before customizing the internationalization of the package, you will need to add the `flutter_localizations` dependency to your` pubspec.yaml`, as shown in the example below.

```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
```

After adding the dependency, create a class in your application that will contain the necessary modifications, this class should inherit the standard internationalization class of the package.

```dart
class CustomExampleLocalizations extends ExampleLocalizations {

  /// Get operator to get the delegate to be used in `MaterialApp`
  static ExampleLocalizationsDelegate get delegate => ExampleLocalizationsDelegate((locale) => CustomExampleLocalizations(locale));

  /// Standard constructor
  CustomLocalization(Locale locale) : super(locale);

  /// Language declaration with messages that will be modified in their respective languages
  @override
  Map<String, Map<dynamic, String>> get customValues => {
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

With the custom class created, it will be necessary to inform the `MaterialApp` that he should use the custom class for internationalization, see below the example.

```dart
MaterialApp(
  localizationsDelegates: [
    /// Inform the default Flutter locations
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    /// Customized localization declaration
    CustomExampleLocalizations.delegate,
  ],
)
```

