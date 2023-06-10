import 'package:flutter/material.dart';

class MyLikeScreen extends StatefulWidget{
  @override
  _MyLikeScreenState createState()=>_MyLikeScreenState();
}

class _MyLikeScreenState extends State<MyLikeScreen>{
  @override
  Widget build(BuildContext context){
    return Center(
      child:Text("LLM 기반 Rose",textScaleFactor: 2),
    );
  }
}