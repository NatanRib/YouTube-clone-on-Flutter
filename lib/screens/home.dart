import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:app_youtube/api.dart';
import 'package:app_youtube/models/video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Home extends StatefulWidget {

  var pesquisa;

  Home(this.pesquisa);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];

  _listarVideos(){
    Api api = Api();
    return api.pesquisa(widget.pesquisa);
  }

  //CICLO DE VIDA DO STFUL WIDGET
  @override
  void initState() {
    print('chamado 1 - init state');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('chamado 2 - did chnage dependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    print('chamado 2 - did update widgets');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('chamado 4 - dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('chamado 3 - build');
    
    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (context, snapshot){
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            if (snapshot.hasData){
              print('HasData');
              print(snapshot.data.length);
              return ListView.separated(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        print(snapshot.data[index].id);
                        FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API,
                          videoId: snapshot.data[index].id,
                          autoPlay: true,
                          appBarColor: themeColor,
                          fullScreen: true
                        );

                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(snapshot.data[index].thumb),
                                fit: BoxFit.cover  
                              )
                            )
                          ),
                          ListTile(
                            
                            title: Text(snapshot.data[index].title),
                            subtitle: Text(snapshot.data[index].description),
                          )
                        ],
                      ),
                    );
                  }, 
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.white,
                      height: 12,
                      
                    );
                  }  
                );
              
            }else{
              return Center(
                child: Text("Erro ao Carregar"),
              );
            }
        }
      }
    );
  }
}