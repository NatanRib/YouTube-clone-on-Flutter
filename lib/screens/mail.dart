import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';


class Mail extends StatefulWidget {
  
  Color secundaryColor = Colors.grey[800];
  Color themeColor = Colors.red[600];

  @override
  _MailState createState() => _MailState();
}

class _MailState extends State<Mail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Mail')
    );
  }
}