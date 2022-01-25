// ignore: import_of_legacy_library_into_null_safe
import 'package:api_youtube/model/video.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: constant_identifier_names
const CHAVE_YOUTUBE_API = "AIzaSyCEoIFeGwKMc1pEfFXuSMJHgFg1kKzKOvg";
// ignore: constant_identifier_names
const ID_CANAL = "UCt_4wzTQqmcUvemNkeO0plA";
// ignore: constant_identifier_names
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
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

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).ToList();
      // ignore: avoid_print
      print("Resultado " + dadosJson[""]);
    }
    else{
    }
  }
}