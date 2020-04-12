import 'package:flutter/foundation.dart';

class Video {
  String title;
  String description;
  String thumb;
  String data;
  String id;

  Video({this.title, this.description, this.thumb, this.data, this.id});

  factory Video.fromJson(json){
    // a palavra factory é usada para podermos retorna outro construtor e para apena gera um obj na memoria
    return Video(
      title : json['snippet']['title'],
      description : json['snippet']['description'], 
      thumb : json['snippet']['thumbnails']['high']['url'], 
      data : json['snippet']['publishedAt'],
      id : json['id']['videoId']
    );
  }

}
