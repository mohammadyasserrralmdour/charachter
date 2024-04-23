import 'package:flutter/material.dart';
import 'package:flutter_advanced/Breaking_bad/data/Model/charachter.dart';
import 'package:flutter_advanced/Breaking_bad/domain/cubit/charachter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharachterScreen extends StatefulWidget {
  const CharachterScreen({Key? key}) : super(key: key);

  @override
  _CharachterScreenState createState() => _CharachterScreenState();
}

class _CharachterScreenState extends State<CharachterScreen> {
  List<CharachterModel> data_api = [];
  List<CharachterModel> data_search = [];

  final TextEditingController _controller=TextEditingController();
  bool isSearching = false;

  @override
  @override
  Widget build(BuildContext context) {
        List<CharachterModel> data_ui = isSearching?data_search:data_api;

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CharachterCubit>().getData();
          },
          child: Text("GetData"),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 140, 240),
          title: isSearching ? _buildsearching() : _buildAppbar(),
          actions: _buildAction(),
        ),
        body: BlocBuilder<CharachterCubit, CharachterState>(
          builder: (_, state) {
            if (state is CharachterLoading) {
              return Progress();
            } else if (state is CharachterLoaded) {
              data_api = state.modeles;
              return buildbody(data_ui);
            } else if (state is CharachterErorr) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildsearching() {
    return TextField(controller: _controller,
    decoration: InputDecoration(hintText: "Find Character"),
    onChanged: (name) {
      data_search=data_api.where((element) => element.name!.toLowerCase().startsWith(_controller.text)).toList();
    },
    );
  }

  Widget _buildAppbar() {
    return Text("Characters");
  }

   List<Widget> _buildAction(){
    return [IconButton(onPressed: () {
      setState(() {
        isSearching=!isSearching;
      });
    }, icon: Icon(isSearching?Icons.clear_rounded:Icons.search))];
   }

  Widget Progress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildbody(List<CharachterModel> modeles) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemCount: modeles.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
                header: Center(
                  child: Text(
                    modeles[index].name ?? "",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: Image.network(modeles[index].image ??
                    "https://rickandmortyapi.com/api/location/1")),
          );
        },
      ),
    );
  }
}
