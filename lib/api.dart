import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/video.dart';

const CHAVE_YOUTUBE_API = 'YOUR API KEY';
const URLBASE = 'https://www.googleapis.com/youtube/v3/';

class Api {

  //a api é responsavel por fazer a construcao dos nossos models

  Future <List<Video>>pesquisa(String pesquisa) async{

    http.Response response = await http.get(
      URLBASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&q=$pesquisa" 
    );

    print(response.statusCode);
    print(response.body.toString());
    print('$pesquisa');

    if (response.statusCode == 200){

      var resultadoPesquisa = json.decode(response.body);

      //FORMA MAIS PERFORMATICA => a func map ja percore o map
      List<Video> listaVideos = resultadoPesquisa['items'].map<Video>(
        (map){//o parametro para cada iteracao
          
          return Video.fromJson(map);//cria a funcao no model que convert no model
        }
      ).toList();//o to list e necessario para gerar a lista
      return listaVideos;
    }else{
      return null;
    }

    

    //MANEIRA MAIS ANTIGA
    /*
    for(Map<String, dynamic> videos in resultadoPesquisa['items']){
      List<Video> listaVideos = List();
      listaVideos.add(Video(videos['snippet']['title'], videos['snippet']['description'], videos['snippet']['thumbnails']['default'], videos['snippet']['publishedAt'], 'tenhoquepreencer'));
      return listaVideos;
    }
    */
    
  }

  

}

