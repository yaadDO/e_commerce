import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartLoading()) {
    on<LoadCart>((event, emit) async {
      emit(CartLoading());
      try {
        final cart = await repository.getCart();
        emit(CartLoaded(cart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    });

    on<AddToCart>((event, emit) {
      final updatedCart = state.items.add(event.product);
      repository.saveCart(updatedCart);
      emit(CartLoaded(updatedCart));
    });
  }
}