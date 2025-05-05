import 'package:e_commerce/presentation/features/products/product_bloc.dart';
import 'package:e_commerce/presentation/features/products/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ProductError) {
          return Center(child: Text(state.message));
        }
        if (state is ProductLoaded) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) => ProductCard(
              product: state.products[index],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}