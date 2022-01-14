import 'package:edu_state/common/routes/routes.dart';
import 'package:edu_state/pages/home/home_page.dart';
import 'package:edu_state/pages/product/product_list_page.dart';
import 'package:edu_state/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String _title = 'Hello State';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const SplashPage(),
      routes: {
        Routes.splash: (BuildContext context) => const SplashPage(),
        Routes.home: (BuildContext context) => const HomePage(),
        Routes.productList: (BuildContext context) => const ProductListPage(),
        // Routes.productDetail: (BuildContext context) =>
        // const ProductDetailPage(),
      },
      onGenerateRoute: Routes.onGeneratedRoutes,
    );
  }
}
