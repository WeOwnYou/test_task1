import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';
import 'package:test_task1/generated/l10n.dart';
import 'package:test_task1/models/subscription_plan/subscription_plan.dart';
import 'package:test_task1/ui/home/home_page.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  // Список тарифов (можно заменить на данные из backend)
  final List<SubscriptionPlan> plans = const <SubscriptionPlan>[
    SubscriptionPlan(
      id: 'month',
      name: 'Месяц',
      price: 299,
      discountPercent: 0,
      subscriptionDuration: SubscriptionDuration.month,
    ),
    SubscriptionPlan(
      id: 'year',
      name: 'Год',
      price: 2999,
      subscriptionDuration: SubscriptionDuration.year,
      discountPercent: 20,
    ),
  ];

  SubscriptionPlan? selectedPlan;

  void _onPurchase() {
    if (selectedPlan == null) return;
    BlocProvider.of<SubscriptionCubit>(context).buySubscription(selectedPlan!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubscriptionCubit, SubscriptionState>(
      listener: (BuildContext context, SubscriptionState state) {
        if ((state.activeSubscription?.isNotEmpty ?? false)&&!state.isLoading) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomeScreen(),
            ),
          );
        }
      },
      child: BlocBuilder<SubscriptionCubit, SubscriptionState>(
  builder: (BuildContext context, SubscriptionState state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.buySubscription),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              // Список тарифов
              Expanded(
                child: ListView.builder(
                  itemCount: plans.length,
                  itemBuilder: (_, int index) {
                    final SubscriptionPlan plan = plans[index];
                    final bool isSelected = plan == selectedPlan;

                    return GestureDetector(
                      onTap: () => setState(() => selectedPlan = plan),
                      child: Card(
                        color: isSelected
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.1)
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: isSelected
                              ? BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                  width: 2,
                                )
                              : BorderSide.none,
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              // Плейсхолдер картинки
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.subscriptions,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      plan.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '${plan.price} ₽',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    if (plan.discountPercent > 0)
                                      Text(
                                        '${S.current.discount}: ${plan.discountPercent}% ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: Colors.green,
                                            ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: _onPurchase,
                child: state.isLoading ? CircularProgressIndicator():Text(S.current.continueOn),
              ),
            ],
          ),
        ),
      );
  },
),
    );
  }
}
