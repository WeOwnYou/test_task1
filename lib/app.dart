import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';
import 'package:test_task1/generated/l10n.dart';
import 'package:test_task1/ui/home/home_page.dart';
import 'package:test_task1/ui/onboarding/onboarding_page.dart';
import 'package:test_task1/ui/res/theme.dart';

class MyApp extends StatelessWidget {
  final SubscriptionCubit subscriptionCubit;
  const MyApp({super.key, required this.subscriptionCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionCubit>(
      create: (BuildContext context) => subscriptionCubit,
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (BuildContext context, SubscriptionState state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: state.isActive ? HomeScreen() : OnboardingScreen(),
          );
        },
      ),
    );
  }
}
