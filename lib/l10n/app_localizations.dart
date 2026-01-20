import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ru'),
    Locale('en')
  ];

  /// No description provided for @welcome.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать!'**
  String get welcome;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Здесь будет краткая инфа про приложение'**
  String get welcomeSubtitle;

  /// No description provided for @onboardingTitle.
  ///
  /// In ru, this message translates to:
  /// **'Доступ по подписке'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы получить доступ к главному экрану и функциям приложения, необходимо оформить подписку.\nВы сможете выбрать удобный тариф на следующем шаге.'**
  String get onboardingSubtitle;

  /// No description provided for @homeTitle.
  ///
  /// In ru, this message translates to:
  /// **'Главный экран'**
  String get homeTitle;

  /// No description provided for @feature1Title.
  ///
  /// In ru, this message translates to:
  /// **'Первая функция'**
  String get feature1Title;

  /// No description provided for @feature1Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание первой функции приложения'**
  String get feature1Subtitle;

  /// No description provided for @feature2Title.
  ///
  /// In ru, this message translates to:
  /// **'Вторая функция'**
  String get feature2Title;

  /// No description provided for @feature2Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание второй функции приложения'**
  String get feature2Subtitle;

  /// No description provided for @feature3Title.
  ///
  /// In ru, this message translates to:
  /// **'Третья функция'**
  String get feature3Title;

  /// No description provided for @feature3Subtitle.
  ///
  /// In ru, this message translates to:
  /// **'Описание третьей функции приложения'**
  String get feature3Subtitle;

  /// No description provided for @yearly.
  ///
  /// In ru, this message translates to:
  /// **'Годовая'**
  String get yearly;

  /// No description provided for @monthly.
  ///
  /// In ru, this message translates to:
  /// **'Ежемесячная'**
  String get monthly;

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Далее'**
  String get next;

  /// No description provided for @continueOn.
  ///
  /// In ru, this message translates to:
  /// **'Продолжить'**
  String get continueOn;

  /// No description provided for @buySubscription.
  ///
  /// In ru, this message translates to:
  /// **'Купите подписку'**
  String get buySubscription;

  /// No description provided for @discount.
  ///
  /// In ru, this message translates to:
  /// **'Скидка'**
  String get discount;

  /// No description provided for @cancelSubscription.
  ///
  /// In ru, this message translates to:
  /// **'Отменить подписку'**
  String get cancelSubscription;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return SEn();
    case 'ru':
      return SRu();
  }

  throw FlutterError(
      'S.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
