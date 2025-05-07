import 'package:e_commerce/components/my_drawer.dart';
import 'package:e_commerce/components/my_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc/product_bloc/product_bloc.dart';
import '../models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else if (state is ProductLoaded) {
            return ListView(
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    'Pick from a selected list of premium products',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    itemCount: state.products.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return MyProductTile(product: product);
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}