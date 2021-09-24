import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/theme_provider.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton(() => ThemeProvider(prefs: locator()));

  final SharedPreferences _prefs = await SharedPreferences.getInstance();

  locator.registerLazySingleton(() => _prefs);
}
