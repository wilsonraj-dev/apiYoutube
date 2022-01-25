import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset("images/youtube.png", width: 98, height: 22,),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: 
      ),
    );
  }
}