import 'package:create_base/app.dart';
import 'package:create_base/core/di/locator.dart';
import 'package:create_base/core/local/hive_storage.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

ServiceLocator dependencyInjector = ServiceLocator();
Future<void> main() async {
  await Hive.initFlutter();
  dependencyInjector.servicesLocator();
  await Hive.openBox(GlobalStorageKey.globalStorage);
  await EasyLocalization.ensureInitialized();
  runApp(App(
    storage: getIt<GlobalStorage>(),
  ));
}
