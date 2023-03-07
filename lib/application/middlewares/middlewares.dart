import 'package:shelf/shelf.dart';

abstract class Middlewares {
  late Handler innderHandler;

  Handler handler(Handler handler) {
    innderHandler = handler;
    return execute;
  }

  Future<Response> execute(Request request);
}
