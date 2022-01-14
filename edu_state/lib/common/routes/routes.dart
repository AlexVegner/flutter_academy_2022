import 'package:edu_state/pages/product/product_detail_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splash = '/';
  static const String home = '/home';
  static const String productList = '/productList';
  static const String productDetail = '/productDetail';

  static Route<dynamic>? onGeneratedRoutes(RouteSettings settings) {
    final pathArgs = settings.name?.split('/') ?? [];
    if (pathArgs[1] == productDetail.split('/')[1]) {
      final productIndex = int.parse(pathArgs[2]);
      return MaterialPageRoute(
          builder: (BuildContext context) =>
              ProductDetailPage(productIndex: productIndex));
    }
  }
}
