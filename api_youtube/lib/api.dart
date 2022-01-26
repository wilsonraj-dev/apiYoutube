import 'package:api_youtube/model/video.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyCEoIFeGwKMc1pEfFXuSMJHgFg1kKzKOvg";
const ID_CANAL = "UCt_4wzTQqmcUvemNkeO0plA";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(
      URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
    );

    if( response.statusCode == 200 ){
      Map<String, dynamic> dadosJson = json.decode( response.body );
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }else{
    }
  }
}