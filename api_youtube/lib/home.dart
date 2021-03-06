import 'package:api_youtube/telas/biblioteca.dart';
import 'package:api_youtube/telas/em_alta.dart';
import 'package:api_youtube/telas/inicio.dart';
import 'package:api_youtube/telas/inscricao.dart';
import 'package:flutter/material.dart';

import 'custom_search_delegate.dart';

class Home extends StatefulWidget {
  const Home({ Key key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";
  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    List<Widget> telas = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca()
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22,),
        actions: <Widget>[
           IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async{
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res;
              });
            },
          ),

          // IconButton(
          //   icon: const Icon(Icons.videocam),
          //   onPressed: (){},
          // ),
          // IconButton(
          //   icon: const Icon(Icons.account_circle),
          //   onPressed: (){},
          // )


        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            label: "In??cio",
            icon: Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          const BottomNavigationBarItem(
            label: "Inscri????es",
            icon: Icon(Icons.subscriptions),
          ),
          const BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ]
      ),
    );
  }
}