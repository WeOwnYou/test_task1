// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message('Welcome!', name: 'welcome', desc: '', args: []);
  }

  /// ` Here will be short info about the app`
  String get welcomeSubtitle {
    return Intl.message(
      ' Here will be short info about the app',
      name: 'welcomeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Subscription required`
  String get onboardingTitle {
    return Intl.message(
      'Subscription required',
      name: 'onboardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `To access the main screen and all app features, you need an active subscription.\nChoose a plan on the next screen.`
  String get onboardingSubtitle {
    return Intl.message(
      'To access the main screen and all app features, you need an active subscription.\nChoose a plan on the next screen.',
      name: 'onboardingSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeTitle {
    return Intl.message('Home Screen', name: 'homeTitle', desc: '', args: []);
  }

  /// `First Feature`
  String get feature1Title {
    return Intl.message(
      'First Feature',
      name: 'feature1Title',
      desc: '',
      args: [],
    );
  }

  /// `Description of the first feature`
  String get feature1Subtitle {
    return Intl.message(
      'Description of the first feature',
      name: 'feature1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Second Feature`
  String get feature2Title {
    return Intl.message(
      'Second Feature',
      name: 'feature2Title',
      desc: '',
      args: [],
    );
  }

  /// `Description of the second feature`
  String get feature2Subtitle {
    return Intl.message(
      'Description of the second feature',
      name: 'feature2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Third Feature`
  String get feature3Title {
    return Intl.message(
      'Third Feature',
      name: 'feature3Title',
      desc: '',
      args: [],
    );
  }

  /// `Description of the third feature`
  String get feature3Subtitle {
    return Intl.message(
      'Description of the third feature',
      name: 'feature3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Yearly`
  String get yearly {
    return Intl.message('Yearly', name: 'yearly', desc: '', args: []);
  }

  /// `Monthly`
  String get monthly {
    return Intl.message('Monthly', name: 'monthly', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Continue`
  String get continueOn {
    return Intl.message('Continue', name: 'continueOn', desc: '', args: []);
  }

  /// `Buy subscription`
  String get buySubscription {
    return Intl.message(
      'Buy subscription',
      name: 'buySubscription',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message('Discount', name: 'discount', desc: '', args: []);
  }

  /// `Cancel subscription`
  String get cancelSubscription {
    return Intl.message(
      'Cancel subscription',
      name: 'cancelSubscription',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
