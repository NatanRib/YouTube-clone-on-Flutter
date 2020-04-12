
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate{
  
  @override
  List<Widget> buildActions(BuildContext context) {
    //sao os botoes de acao do lado direito
    return [
      IconButton(icon: Icon(Icons.close), 
        onPressed: (){
          query = '';
        }
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //botao de acao do lado esquerdo
    return IconButton(
      icon: Icon(Icons.arrow_back), onPressed: (){
        close(context, '');
      });
  }

  @override
  Widget buildResults(BuildContext context) {
    //quando é enviado o resultado
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //é chamado a cada letra digitada na query

    List<String> sugestoes = List();

    if (query.isNotEmpty){
      sugestoes = [
        'android', 'flutter', 'framework', 'programação', 'ios', 'games'
      ].where(
        (texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();
    }
    return ListView.builder(
      itemCount: sugestoes.length,
      itemBuilder: (context, index){
        return ListTile(
          onTap: (){
            close(context, sugestoes[index]);
          },
          leading: IconButton(icon: Icon(Icons.search), onPressed: null),
          title: Text(sugestoes[index]),
          trailing: IconButton(icon: Icon(Icons.arrow_upward), onPressed: null),
        );
      }
    );
    
    
  }

}