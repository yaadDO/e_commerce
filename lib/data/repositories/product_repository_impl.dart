class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await dataSource.fetchProducts();
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}