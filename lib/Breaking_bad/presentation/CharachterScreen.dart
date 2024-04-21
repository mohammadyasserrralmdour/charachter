import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:flutter_advanced/Breaking_bad/domain/cubit/charachter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class CharachterScreen extends StatefulWidget {
  const CharachterScreen({Key? key}) : super(key: key);

  @override
  _CharachterScreenState createState() => _CharachterScreenState();
}
Logger logger = Logger();

RemouteDataSourceImp remouteDataSource = RemouteDataSourceImp();
CharacterRepo characterRepo =
    CharacterRepo(remouteDataSource: remouteDataSource);

class _CharachterScreenState extends State<CharachterScreen> {
   List<CharachterModel> data=[];
  @override
  // void initState() {
    
   
  //   CharachterCubit(characterRepo).getData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      context.read<CharachterCubit>().getData();
    },child: Text("GetData"),
),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 140, 240),
          title: const Text(''),
        ),
        body:
BlocBuilder<CharachterCubit, CharachterState>(
          builder: (_, state) {
            if(state is CharachterLoading){
              return Progress();
            }
            else if(state is CharachterLoaded){
              data=state.modeles;
              return buildbody();
            }
            else if(state is CharachterErorr){
              return Text(state.message);
            }
            else {return Container();}
           
            
          },
        )
        );
  }

  Widget Progress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildbody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20,crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GridTile(
            child:Image.network(data[index].image??"https://rickandmortyapi.com/api/location/1") 
            );
      },
    );
  }
}
