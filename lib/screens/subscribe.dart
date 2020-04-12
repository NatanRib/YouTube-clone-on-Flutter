import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  
  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];
  
  @override
  _SubscribeState createState() => _SubscribeState();
}

class _SubscribeState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Subscribe')
    );
  }
}