import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  
  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Library')
    );
  }
}