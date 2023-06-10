import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:community/mainpage.dart';

class LandingPage extends StatefulWidget{
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Get.offAll(MainPage());
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children:[
          Container(
              width:MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height,
              child: Image.asset('assets/image/bluerose.jpeg',fit: BoxFit.cover,)
          ),
          Center(
            child: Column( // 컨테이너 위젯
              children: [
                SizedBox(height: 100.0,),
                Text(
                  'Disorder-Rose',
                  style: TextStyle(fontFamily:'Lobster',fontSize:60,color:Colors.white),
                ),
                SizedBox(height: 180.0,),
                SizedBox(
                    width:80, height:80,
                    child: CircularProgressIndicator(
                      valueColor:AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      backgroundColor: Colors.white,
                      strokeWidth: 15.0,
                    ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}