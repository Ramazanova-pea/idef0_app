import 'package:get_it/get_it.dart';

import '../app_state/app_state_data.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<AppStateData>(() => AppStateData());
}

