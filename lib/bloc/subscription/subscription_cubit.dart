import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:test_task1/api/subscription_repository.dart';
import 'package:test_task1/models/active_subscription/active_subscription.dart';
import 'package:test_task1/models/subscription_plan/subscription_plan.dart';

part 'subscription_cubit.freezed.dart';
part 'subscription_cubit.g.dart';

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const SubscriptionState._();

  const factory SubscriptionState({
    ActiveSubscription? activeSubscription,
    @Default(false) bool isLoading,
  }) = _SubscriptionState;

  factory SubscriptionState.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionStateFromJson(json);

  bool get isActive =>
      activeSubscription != null && activeSubscription!.isNotEmpty;
}

class SubscriptionCubit extends HydratedCubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionState());

  // /// Проверка подписки (например, с сервера)
  // void checkSubscription(ActiveSubscription subscription) {
  //   emit(state.copyWith(activeSubscription: subscription));
  // }

  Future<void> cancelSubscription() async {
    if (state.activeSubscription == null) return;
    try {
      emit(state.copyWith(isLoading: true));
      final bool success = await SubscriptionRepository.singleton()
          .cancelSubscription(state.activeSubscription!);
      if (success) {
        emit(state.copyWith(activeSubscription: null));
      }
    } on Exception {
      //TODO: реализовать обработчик ошибок
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> buySubscription(SubscriptionPlan subscriptionPlan) async {
    try {
      emit(state.copyWith(isLoading: true));
      final ActiveSubscription activeSubscription =
          await SubscriptionRepository.singleton()
              .buySubscription(subscriptionPlan);
      emit(state.copyWith(activeSubscription: activeSubscription));
    } on Exception {
      //TODO: реализовать обработчик ошибок
    }
    emit(state.copyWith(isLoading: false));
  }

  // /// Локальное обновление состояния подписки
  // void updateSubscription(ActiveSubscription subscription) {
  //   emit(state.copyWith(activeSubscription: subscription));
  // }

  @override
  SubscriptionState? fromJson(Map<String, dynamic> json) {
    try {
      return SubscriptionState.fromJson(json);
    } on Exception catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(SubscriptionState state) {
    return state.toJson();
  }
}
