import 'package:api_pet/application/config/database_connection_configure.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

import './i_database_connection.dart';

@LazySingleton(as: IDatabaseConnection)
class DatabaseConnection implements IDatabaseConnection {
  final DatabaseConnectionConfigure _config;

  DatabaseConnection(this._config);

  @override
  Future<MySqlConnection> openConnection() async {
    return MySqlConnection.connect(
      ConnectionSettings(
        host: _config.host,
        user: _config.user,
        password: _config.password,
        db: _config.databaseName,
        port: _config.port,
      ),
    );
  }
}
