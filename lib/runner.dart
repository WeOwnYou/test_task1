import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_task1/app.dart';
import 'package:test_task1/bloc/subscription/subscription_cubit.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getApplicationDocumentsDirectory()).path,
    ),
  );

  final SubscriptionCubit subscriptionCubit = SubscriptionCubit();

  // runZoned(() => runApp(MyApp(subscriptionCubit: subscriptionCubit)));
  runApp(MyApp(subscriptionCubit: subscriptionCubit));
}
