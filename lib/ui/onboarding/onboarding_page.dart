import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';
import 'package:test_task1/generated/l10n.dart';
import 'package:test_task1/ui/home/home_page.dart';
import 'package:test_task1/ui/paywall/paywall_page.dart';
import 'package:test_task1/ui/res/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = <Map<String, String>>[
    <String, String>{
      'title': S.current.welcome,
      'subtitle': S.current.welcomeSubtitle,
      'image': AppImages.instance.onboarding1,
    },
    <String, String>{
      'title': S.current.onboardingTitle,
      'subtitle': S.current.onboardingSubtitle,
      'image': AppImages.instance.onboarding2,
    },
  ];

  Future<void> _onContinue() async {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const PaywallScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionCubit, SubscriptionState>(
  builder: (BuildContext context, SubscriptionState state) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (int index) =>
                    setState(() => _currentPage = index),
                itemBuilder: (_, int index) {
                  final Map<String, String> page = _pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(page['image']!, height: 280),
                      const SizedBox(height: 32),
                      Text(
                        page['title']!,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page['subtitle']!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  );
                },
              ),
            ),

            // Индикатор
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                _pages.length,
                (int i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: _currentPage == _pages.length - 1
                  ? _onContinue
                  : () => _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      ),
              child: Text(
                _currentPage == _pages.length - 1 ? S.current.next : S.current.continueOn,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  },
);
  }
}
