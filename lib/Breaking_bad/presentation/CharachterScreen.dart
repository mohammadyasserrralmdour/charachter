import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/data/Repositry/repositry.dart';
import 'package:flutter_advanced/Breaking_bad/data/datasource/remouteDatasourcee.dart';
import 'package:flutter_advanced/Breaking_bad/domain/cubit/charachter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharachterScreen extends StatefulWidget {
  const CharachterScreen({Key? key}) : super(key: key);

  @override
  _CharachterScreenState createState() => _CharachterScreenState();
}

RemouteDataSourceImp remouteDataSource = RemouteDataSourceImp();
CharacterRepo characterRepo=CharacterRepo(remouteDataSource: remouteDataSource);
class _CharachterScreenState extends State<CharachterScreen> {
  late List<CharachterModel> data ;
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   try{
  //     CharachterCubit(characterRepo).getData();
  //   }catch(e,s){
  //     print("$s");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 140, 240),
          title: const Text(''),
        ),
        body:ElevatedButton(onPressed: () {
          characterRepo.getData();
        }, child: Text("Change"))
        
        //  BlocBuilder<CharachterCubit, CharachterState>(
        //   builder: (_, state) {
        //     if (state is CharachterLoaded) {
        //       data = (state).modeles;
        //       return buildbody();
        //     } else   {
        //       return Progress();
        //     } 
        //     // else {
        //     //   return Center(child: Text("Erorr"),);
        //     // }
        //   },
        // )
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
        crossAxisCount: 2,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return GridTile(child: Container(color: Colors.red,child: Text("data"),));
      },
    );
  }
}
