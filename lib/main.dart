import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/presentation/CharachterScreen.dart';
import 'package:flutter_advanced/core/routing.dart';

void main() {
  runApp(const MyApp());
}
      AppRoute appRoute=AppRoute();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return  MaterialApp(
     onGenerateRoute:(settings) => appRoute.getnerator(settings) ,
debugShowCheckedModeBanner: false
    );
  }
}

