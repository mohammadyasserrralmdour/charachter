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
  
  final TextEditingController _controller = TextEditingController();
  bool isSearching = false;

  @override
  void initState()  {
     context.read<CharachterCubit>().getData();
    super.initState();
  }

  Widget build(BuildContext context) {
   

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.read<CharachterCubit>().getData();
          },
          child: Text("GetData"),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 231, 140, 240),
          title: isSearching ? _buildsearching() : _buildAppbar(),
          actions: _buildAction(),
        ),
        body: BlocBuilder<CharachterCubit, CharachterState>(
          buildWhen: (previous, current) =>
              current is CharachterLoaded ||
              current is CharachterErorr ||
              current is CharachterLoading,
          builder: (context, state) {
            if (state is CharachterLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CharachterLoaded) {
              data_api = state.modeles;
              data_search =isSearching?data_search :state.modeles;
              return buildbody(isSearching?data_search:data_api);
        
            } else if (state is CharachterErorr) {
              return Text(state.message);
            } else {
              return Container();
            }
          },
        ));
  }

  Widget _buildsearching() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(hintText: "Find Character"),
      onChanged: (nam) {
        setState(() {
          data_search = data_api
            .where((element) =>
                element.name!.toLowerCase().startsWith(_controller.text))
            .toList();
            print(data_search.length.toString());
        });
      },
    );
  }

  Widget _buildAppbar() {
    return Text("Characters");
  }

  List<Widget> _buildAction() {
    return [
      IconButton(
          onPressed: () {
            setState(() {
              isSearching = !isSearching;
            });
          },
          icon: Icon(isSearching ? Icons.clear_rounded : Icons.search))
    ];
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
