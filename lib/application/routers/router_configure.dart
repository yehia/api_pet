import 'package:shelf_router/shelf_router.dart';

import 'package:api_pet/application/routers/i_router.dart';
import 'package:api_pet/modules/teste/teste_router.dart';

class RouterConfigure {
  final Router _router;

  final List<IRouter> _routers = [
    TesteRouter(),
  ];

  RouterConfigure(this._router);

  void configure() {
    for (var r in _routers) {
      r.configure(_router);
    }
  }
}
