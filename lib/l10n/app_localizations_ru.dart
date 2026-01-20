// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class SRu extends S {
  SRu([String locale = 'ru']) : super(locale);

  @override
  String get welcome => 'Добро пожаловать!';

  @override
  String get welcomeSubtitle => 'Здесь будет краткая инфа про приложение';

  @override
  String get onboardingTitle => 'Доступ по подписке';

  @override
  String get onboardingSubtitle =>
      'Чтобы получить доступ к главному экрану и функциям приложения, необходимо оформить подписку.\nВы сможете выбрать удобный тариф на следующем шаге.';

  @override
  String get homeTitle => 'Главный экран';

  @override
  String get feature1Title => 'Первая функция';

  @override
  String get feature1Subtitle => 'Описание первой функции приложения';

  @override
  String get feature2Title => 'Вторая функция';

  @override
  String get feature2Subtitle => 'Описание второй функции приложения';

  @override
  String get feature3Title => 'Третья функция';

  @override
  String get feature3Subtitle => 'Описание третьей функции приложения';

  @override
  String get yearly => 'Годовая';

  @override
  String get monthly => 'Ежемесячная';

  @override
  String get next => 'Далее';

  @override
  String get continueOn => 'Продолжить';

  @override
  String get buySubscription => 'Купите подписку';

  @override
  String get discount => 'Скидка';

  @override
  String get cancelSubscription => 'Отменить подписку';
}
