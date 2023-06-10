import 'package:flutter/material.dart';

class ShowGridScreen extends StatefulWidget{
  @override
  _ShowGridScreenState createState()=>_ShowGridScreenState();
}

class _ShowGridScreenState extends State<ShowGridScreen>{
  @override
  Widget build(BuildContext context){
    return Center(
      child: IconButton(
        icon: const Icon(Icons.add_a_photo,),
        iconSize: 150,
        onPressed: (){},
      ),
    );
  }
}