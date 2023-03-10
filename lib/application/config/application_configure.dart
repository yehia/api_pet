import 'package:api_pet/application/config/service_locator_configure.dart';
import 'package:api_pet/application/routers/router_configure.dart';
import 'package:get_it/get_it.dart';
import 'package:dotenv/dotenv.dart';

import 'package:api_pet/application/config/database_connection_configure.dart';
import 'package:api_pet/application/logger/i_logger.dart';
import 'package:api_pet/application/logger/logger.dart';
import 'package:shelf_router/shelf_router.dart';

class ApplicationConfigure {
  Future<void> loadConfigApplication(Router router) async {
    await _loadEnv();
    _loadDatabaseConfigure();
    _configureLogger();
    _loadDependencies();
    _loadRoutersConfigure(router);
  }

  Future<void> _loadEnv() async => load();

  void _loadDatabaseConfigure() {
    final databaseConfigure = DatabaseConnectionConfigure(
      host: env['DATABASE_HOST'] ?? env['databaseHost']!,
      user: env['DATABASE_USER'] ?? env['databaseUser']!,
      password: env['DATABASE_PASSWORD'] ?? env['databasePassword']!,
      databaseName: env['DATABASE_NAME'] ?? env['databaseName']!,
      port: int.tryParse(env['DATABASE_PORT'] ?? env['databasePort']!) ?? 0,
    );

    GetIt.I.registerSingleton(databaseConfigure);
  }

  void _configureLogger() =>
      GetIt.I.registerLazySingleton<ILogger>(() => Logger());

  void _loadDependencies() => configureDependencies();

  void _loadRoutersConfigure(Router router) =>
      RouterConfigure(router).configure();
}
