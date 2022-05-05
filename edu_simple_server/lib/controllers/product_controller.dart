import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'product_controller.g.dart';

class ProductController {
  ProductController();

  @Route.get('/products/')
  Future<Response> listProducts(Request request) async {
    return Response.ok('["user1"]');
  }

  @Route.get('/products/<productId>')
  Future<Response> fetchProduct(Request request, String productId) async {
    if (productId == 'product1') {
      return Response.ok('product1');
    }
    return Response.notFound('no such product');
  }

  // Create router using the generate function defined in 'userservice.g.dart'.
  Router get router => _$ProductControllerRouter(this);
}
