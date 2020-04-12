import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  
  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Explore')
    );
  }
}