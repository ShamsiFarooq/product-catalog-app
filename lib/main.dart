import 'package:flutter/material.dart';
import 'package:product_catalog_app/controller/product_provider.dart';
import 'package:product_catalog_app/view/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductProvider()..fetchProducts(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 162, 183)),
      ),
      home: SplashScreen(),
    );
  }
}

