import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test1Screen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('done'),),
      body: Center(child: TextField()),
    );
  }
}