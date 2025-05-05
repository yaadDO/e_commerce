import 'package:equatable/equatable.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> products;
  const ProductLoaded(this.products);
}
class ProductError extends ProductState {
  final String message;
  const ProductError(this.message);
}