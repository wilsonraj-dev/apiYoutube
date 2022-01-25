import 'package:api_youtube/api.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({ Key? key }) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.pesquisar("");

    return const Center(
      child: Text(
        "Início",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}