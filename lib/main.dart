import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/presentation/charachter_screen.dart';
import 'package:flutter_advanced/core/BlocObserve.dart';
import 'package:flutter_advanced/core/dependencyInjection.dart';
import 'package:flutter_advanced/core/routing.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DependencyInjection.init();
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

