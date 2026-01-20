// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'Welcome!';

  @override
  String get welcomeSubtitle => ' Here will be short info about the app';

  @override
  String get onboardingTitle => 'Subscription required';

  @override
  String get onboardingSubtitle =>
      'To access the main screen and all app features, you need an active subscription.\nChoose a plan on the next screen.';

  @override
  String get homeTitle => 'Home Screen';

  @override
  String get feature1Title => 'First Feature';

  @override
  String get feature1Subtitle => 'Description of the first feature';

  @override
  String get feature2Title => 'Second Feature';

  @override
  String get feature2Subtitle => 'Description of the second feature';

  @override
  String get feature3Title => 'Third Feature';

  @override
  String get feature3Subtitle => 'Description of the third feature';

  @override
  String get yearly => 'Yearly';

  @override
  String get monthly => 'Monthly';

  @override
  String get next => 'Next';

  @override
  String get continueOn => 'Continue';

  @override
  String get buySubscription => 'Buy subscription';

  @override
  String get discount => 'Discount';

  @override
  String get cancelSubscription => 'Cancel subscription';
}
