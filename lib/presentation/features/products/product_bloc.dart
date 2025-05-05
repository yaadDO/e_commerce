import 'package:e_commerce/presentation/features/products/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductLoading()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) {
      final filtered = state.products.where((p) =>
          p.name.toLowerCase().contains(event.query.toLowerCase())).toList();
      emit(ProductLoaded(filtered));
    });
  }
}