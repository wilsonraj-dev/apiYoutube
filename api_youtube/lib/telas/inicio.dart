import 'package:api_youtube/api.dart';
import 'package:api_youtube/model/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

// ignore: must_be_immutable
class Inicio extends StatefulWidget {
  //const Inicio({ Key key }) : super(key: key);

  String pesquisa;
  Inicio(this.pesquisa, {Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa){
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      // ignore: missing_return
      builder: (contex, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return const Center(
              child: CircularProgressIndicator(

              )
            );
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){
              return ListView.separated(
                itemBuilder: (context, index){
                  List<Video> videos = snapshot.data;
                  Video video = videos[index];
                  return GestureDetector(
                    onTap: (){
                      FlutterYoutube.playYoutubeVideoById(
                        apiKey: CHAVE_YOUTUBE_API, 
                        videoId: video.id
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),
                        )
                      ],
                    ),
                  );
                }, 
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  color: Colors.grey,
                ),
                itemCount: snapshot.data.length
              );
            }
            else{
              return const Center(
              child: Text("Nenhum dado a ser exibido.")
            );
          }
        }
      },
    );
  }
}