import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = "";
        }, 
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, "");
        }, 
        icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> list = [];

    if(query.isNotEmpty){
      list = [
        "Naruto", "Marvel", "DC", "Saitama", "Dragon Ball", "UCM", "MCU", "Cavaleiro"
      ].where((texto) => texto.toLowerCase().startsWith(query.toLowerCase())).toList();

        return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              close(context, list[index]);
            },
            title: Text(list[index]),
          );
        }
      );
    }
    else{
      return const Center(
        child: Text("Nenhum resultado para a pesquisa."),
      );
    }
  }
}