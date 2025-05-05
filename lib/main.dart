import 'package:e_commerce/presentation/features/cart/cart_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/product_repository_impl.dart';
import 'presentation/features/auth/auth_bloc.dart';
import 'presentation/features/products/product_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc(AuthRepositoryImpl())),
        BlocProvider(create: (_) => CartBloc(CartRepositoryImpl())),
        BlocProvider(create: (_) => ProductBloc(ProductRepositoryImpl())),
      ],
      child: MaterialApp.router(
        title: 'E-Commerce App',
        theme: AppTheme.light,
        routerConfig: AppRouter.router,
      ),
    );
  }
}