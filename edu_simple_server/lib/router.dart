import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'controllers/product_controller.dart';

Handler buildRouter() {
  final app = Router();
  app.get('/ping', (Request request) => Response.ok('body'));
  app.mount(
    '/v1',
    Router()
      ..get('/ping', (Request request) => Response.ok('test'))
      ..mount('/products', ProductController().router),
  );
  return app;
}
