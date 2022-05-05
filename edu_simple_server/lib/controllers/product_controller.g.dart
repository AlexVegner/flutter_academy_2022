// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ProductControllerRouter(ProductController service) {
  final router = Router();
  router.add('GET', r'/products/', service.listProducts);
  router.add('GET', r'/products/<productId>', service.fetchProduct);
  return router;
}
