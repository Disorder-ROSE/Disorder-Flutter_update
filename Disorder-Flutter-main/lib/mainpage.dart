import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './mainpages/board.dart';
import './mainpages/llmrose.dart';
import './mainpages/camera.dart';
import 'testpage.dart';

class MainPage extends StatefulWidget{

  @override
  _MainPageState createState()=>_MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _selectedIndex=0;
  List<BottomNavigationBarItem> bottomItems=[
    BottomNavigationBarItem(
      label:'시각장애인 카메라로 봉지과자 식별기능',
      icon:Icon(Icons.add_a_photo),
    ),
    BottomNavigationBarItem(
      label:'장애관련 정보공유 게시판',
      icon:Icon(Icons.home_filled),
    ),
    BottomNavigationBarItem(
      label:'LLM 기반 Rose',
      icon:Icon(Icons.adb),
    ),
  ];
  List pages=[
    ShowGridScreen(),
    HomeScreen(),
    MyLikeScreen(),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: (){
            Get.to(TestPage());
          },
          child: Text(
            'Disorder-Rose',
            style:TextStyle(
                fontFamily:'Lobster',
                fontSize:30,
                color:Colors.black
            ),
          ),
        ),
        centerTitle:true,
        backgroundColor:Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, //Bar의 배경색
        selectedItemColor: Colors.black, //선택된 아이템의 색상
        unselectedItemColor: Colors.grey.withOpacity(.60), //선택 안된 아이템의 색상
        selectedFontSize: 14, //선택된 아이템의 폰트사이즈
        unselectedFontSize: 10, //선택 안된 아이템의 폰트사이즈
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap:(int index){
          setState((){
            _selectedIndex=index;
          });
        },
        items:bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }
}

/*title: Text('Disorder-Rose',style:TextStyle(fontFamily:'Lobster',fontSize:30,color:Colors.black),),
centerTitle:true,
backgroundColor:Colors.white,*/