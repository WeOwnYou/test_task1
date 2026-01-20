import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';
import 'package:test_task1/generated/l10n.dart';
import 'package:test_task1/ui/home/widgets/feature_card.dart';
import 'package:test_task1/ui/onboarding/onboarding_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionCubit, SubscriptionState>(
      listener: (BuildContext context, SubscriptionState state) {
        if ((state.activeSubscription?.isEmpty ?? true) && !state.isLoading) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const OnboardingScreen(),
            ),
          );
        }
      },
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
        builder: (BuildContext context, SubscriptionState state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Home')),
            body: Column(
              children: [
                // Контент
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      FeatureCard(
                        title: S.current.feature1Title,
                        subtitle: S.current.feature1Subtitle,
                        imageUrl: 'assets/images/home1.png',
                      ),
                      FeatureCard(
                        title: S.current.feature2Title,
                        subtitle: S.current.feature2Subtitle,
                        imageUrl: 'assets/images/home2.png',
                      ),
                      FeatureCard(
                        title: S.current.feature3Title,
                        subtitle: S.current.feature3Subtitle,
                        imageUrl: 'assets/images/home3.png',
                      ),

                      SizedBox(height: 80), // высота кнопки + немного отступа
                    ],
                  ),
                ),

                // Кнопка внизу
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: BlocProvider.of<SubscriptionCubit>(context)
                        .cancelSubscription,
                    style: ElevatedButton.styleFrom(
                      minimumSize:
                          const Size.fromHeight(50), // кнопка по ширине экрана
                    ),
                    child: state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(S.current.cancelSubscription),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
