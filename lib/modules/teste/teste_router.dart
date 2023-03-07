import 'package:shelf_router/shelf_router.dart';

import 'package:api_pet/application/routers/i_router.dart';
import 'package:api_pet/modules/teste/teste_controller.dart';

class TesteRouter implements IRouter {
  @override
  void configure(Router router) {
    router.mount('/hello/', TesteController().router);
  }
}
