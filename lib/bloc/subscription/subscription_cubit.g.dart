// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionState _$SubscriptionStateFromJson(Map<String, dynamic> json) =>
    _SubscriptionState(
      activeSubscription: json['activeSubscription'] == null
          ? null
          : ActiveSubscription.fromJson(
              json['activeSubscription'] as Map<String, dynamic>),
      isLoading: json['isLoading'] as bool? ?? false,
    );

Map<String, dynamic> _$SubscriptionStateToJson(_SubscriptionState instance) =>
    <String, dynamic>{
      'activeSubscription': instance.activeSubscription,
      'isLoading': instance.isLoading,
    };
