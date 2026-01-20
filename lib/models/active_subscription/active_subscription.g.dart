// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActiveSubscription _$ActiveSubscriptionFromJson(Map<String, dynamic> json) =>
    _ActiveSubscription(
      id: json['id'] as String,
      name: json['name'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$ActiveSubscriptionToJson(_ActiveSubscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };
