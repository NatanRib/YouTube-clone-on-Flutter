import 'package:flutter/material.dart';
import 'package:app_youtube/screens/home.dart';
import 'package:app_youtube/screens/explore.dart';
import 'package:app_youtube/screens/library.dart';
import 'package:app_youtube/screens/mail.dart';
import 'package:app_youtube/screens/subscribe.dart';
import 'customSearchDelegate.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int indiceAtual = 0;
  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];
  var _res = '';
  
  

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Home(_res),
      Explore(),
      Subscribe(),
      Mail(),
      Library(),
    ];
    
    print(_res);
   
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: secundaryColor,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: GestureDetector(
          onTap: (){
            print('Youtube');
          },
          child: Image.asset(
            'assets/images/youtube.png',
            height: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print('Account Circle');
            } 
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              var resultado = await showSearch(
                context: context,
                delegate: CustomSearchDelegate()
              );
              setState(() {
                _res = resultado;
              });
            } 
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print('Account Circle');
            } 
          )
        ],
      ),
      body:Container(
        padding: EdgeInsets.all(16),
        child:  telas[indiceAtual],
      ),

      bottomNavigationBar: BottomNavigationBar(
        fixedColor: themeColor,
        unselectedItemColor: secundaryColor,
        unselectedLabelStyle: TextStyle(color: secundaryColor),
        type: BottomNavigationBarType.fixed,
        currentIndex: indiceAtual,
        onTap: (index){
          setState(() {
            indiceAtual = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicio')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explorar')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text('Incriçoes')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.email),
            title: Text('Entrada')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            title: Text('Blibioteca')
          )
        ]
      )
    );
  }
}

