import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:flutter_advanced/Breaking_bad/domain/cubit/charachter_cubit.dart';
import 'package:flutter_advanced/Breaking_bad/presentation/charachter_screen.dart';
import 'package:flutter_advanced/Breaking_bad/presentation/charactar_details_screen.dart';
import 'package:flutter_advanced/core/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  late CharacterRepo repo;
  AppRoute() {
    repo = CharacterRepo(remouteDataSource: RemouteDataSourceImp());
  }
  getnerator(RouteSettings setting) {
    switch (setting.name) {
      case charactarScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            child: CharachterScreen(),
            create: (context) => CharachterCubit(repo),
          ),
        );
      case charactarScreen:
        return MaterialPageRoute(
          builder: (_) => const CharactarDetailsScreen(),
        );
    }
  }
}
