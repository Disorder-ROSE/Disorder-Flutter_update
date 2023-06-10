import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './makepostpage.dart';

class TestPage extends StatefulWidget{
  const TestPage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _TestPageState createState()=>_TestPageState();
}

class _TestPageState extends State<TestPage>{
  FirebaseFirestore fireStores=FirebaseFirestore.instance;
  var name="??";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text("테스트페이지"),),
      body: Center(
        child: Container(
          child:Column(
            children:[
              const SizedBox(height: 100,),
              Text(name),
              ElevatedButton(
                  onPressed: () async{
                    DocumentSnapshot test1docData=await fireStores.collection('Test').doc('test1doc').get();
                    setState((){
                      name=test1docData['name'];
                    });
                  },
                  child: const Text('데이터 불러오기')
              ),
              ElevatedButton(
                onPressed: (){
                  Get.to(MakePostPage());
                },
                child: Text("포스팅올리기 페이지로")
              ),
            ],
          ),
        ),
      ),
    );
  }
}