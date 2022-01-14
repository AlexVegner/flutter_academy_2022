import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final int productIndex;
  const ProductDetailPage({Key? key, required this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO change color
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail $productIndex'),
      ),
    );
  }
}
