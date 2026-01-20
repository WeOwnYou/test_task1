import 'package:test_task1/models/active_subscription/active_subscription.dart';
import 'package:test_task1/models/subscription_plan/subscription_plan.dart';

class SubscriptionRepository {
  static final SubscriptionRepository _singleton =
      SubscriptionRepository._internal();

  SubscriptionRepository._internal();

  factory SubscriptionRepository.singleton() {
    return _singleton;
  }

  Future<bool> cancelSubscription(ActiveSubscription activeSubscription) async {
    await Future<void>.delayed(Duration(seconds: 1));
    return true;
  }

  Future<ActiveSubscription> buySubscription(
    SubscriptionPlan subscriptionPlan,
  ) async {
    await Future<void>.delayed(Duration(seconds: 1));
    final DateTime startDate = DateTime.now();
    final DateTime endDate = startDate.add(Duration(days: 365));
    return ActiveSubscription(
      id: subscriptionPlan.id,
      name: subscriptionPlan.name,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
