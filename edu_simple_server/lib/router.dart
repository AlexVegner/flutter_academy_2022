import 'package:edu_simple_server/controllers/product_controller.dart';
import 'package:shelf_plus/shelf_plus.dart';

Handler buildRouter() {
  final app = Router().plus;
  final appV1 = Router();
  app.all('/v1', appV1);
  final productController = ProductController();
  appV1.all('/products', productController.router);
  return productController.router;
}
