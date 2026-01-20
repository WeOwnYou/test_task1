// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionPlan _$SubscriptionPlanFromJson(Map<String, dynamic> json) =>
    _SubscriptionPlan(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      subscriptionDuration: $enumDecode(
          _$SubscriptionDurationEnumMap, json['subscriptionDuration']),
      discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SubscriptionPlanToJson(_SubscriptionPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'subscriptionDuration':
          _$SubscriptionDurationEnumMap[instance.subscriptionDuration]!,
      'discountPercent': instance.discountPercent,
      'name': instance.name,
    };

const _$SubscriptionDurationEnumMap = {
  SubscriptionDuration.month: 'month',
  SubscriptionDuration.year: 'year',
};
