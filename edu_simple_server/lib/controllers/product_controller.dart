import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../models/product.dart';

part 'product_controller.g.dart';

class ProductController {
  List<Product> products = [];
  ProductController();

  @Route.get('/')
  Future<Response> listProducts(Request request) async {
    return Response.ok(jsonEncode(products.map((e) => e.toJson())));
  }

  @Route.get('/ping')
  Future<Response> ping(Request request) async {
    return Response.ok('ping');
  }

  @Route.get('/<productId>')
  Future<Response> fetchProduct(Request request, String productId) async {
    // final rawJson = await request.readAsString();
    // final json = jsonDecode(rawJson);

    if (productId == 'product1') {
      return Response.ok('product1');
    }
    return Response.notFound('no such product');
  }

  @Route.post('/')
  Future<Response> createProduct(Request request) async {
    final rawJson = request.readAsString();
    final json = jsonEncode(rawJson) as Map<String, dynamic>;
    final product = Product.fromJson(json);

    products.add(product);
    return Response.notFound('no such product');
  }

  // Create router using the generate function defined in 'userservice.g.dart'.
  Router get router => _$ProductControllerRouter(this);
}
