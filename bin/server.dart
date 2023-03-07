import 'dart:io';

import 'package:api_pet/application/config/application_configure.dart';
import 'package:api_pet/application/middlewares/cors/cors_middleware.dart';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  final router = Router();
  final appConfig = ApplicationConfigure();
  await appConfig.loadConfigApplication(router);

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(CorsMiddleware().handler)
      .addMiddleware(logRequests())
      .addHandler(router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
