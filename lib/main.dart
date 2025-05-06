import 'package:e_commerce/pages/intro_page.dart';
import 'package:e_commerce/pages/shop_page.dart';
import 'package:e_commerce/themes/light_mode.dart';
import 'package:flutter/material.dart';

import 'pages/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
       '/intro_page':(context) => const IntroPage(),
       '/shop_page':(context) => const ShopPage(),
       '/cart_page':(context) => const CartPage(),
      },
    );
  }
}

