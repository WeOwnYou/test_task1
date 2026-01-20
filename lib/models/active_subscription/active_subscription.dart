import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_subscription.freezed.dart';
part 'active_subscription.g.dart';

@freezed
abstract class ActiveSubscription with _$ActiveSubscription {
  const ActiveSubscription._();

  const factory ActiveSubscription({
    required String id,
    required String name,
    required DateTime startDate,
    required DateTime endDate,
  }) = _ActiveSubscription;

  //Чтобы был плейсхолдер, на случай ошибок, или надо будет отобраззить что-то
  static final ActiveSubscription empty = ActiveSubscription(
    id: 'id',
    name: 'name',
    startDate: DateTime(0),
    endDate: DateTime(0),
  );

  bool get isEmpty => this == empty;
  bool get isNotEmpty => this != empty;

  factory ActiveSubscription.fromJson(Map<String, dynamic> json) =>
      _$ActiveSubscriptionFromJson(json);
}
