import 'package:flutter/material.dart';
import '../models/product.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary,),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          // product image
          Icon(Icons.favorite),

          // product name
          Text(product.name),

          // product description
          Text(product.description),

          // product price + add to cart button
          Text(product.price.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
