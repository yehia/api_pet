import 'package:api_pet/application/config/database_connection_configure.dart';
import 'package:dotenv/dotenv.dart';
import 'package:get_it/get_it.dart';

class ApplicationConfigure {
  Future<void> loadConfigApplication() async {
    await _loadEnv();
    _loadDatabaseConfigure();
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
}
