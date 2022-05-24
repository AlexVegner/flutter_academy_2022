// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ProductControllerRouter(ProductController service) {
  final router = Router();
  router.add('GET', r'/', service.listProducts);
  router.add('GET', r'/ping', service.ping);
  router.add('GET', r'/<productId>', service.fetchProduct);
  router.add('POST', r'/', service.createProduct);
  return router;
}
