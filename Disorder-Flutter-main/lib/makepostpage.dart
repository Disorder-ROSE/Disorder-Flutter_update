import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MakePostPage extends StatefulWidget{
  @override
  _MakePostPageState createState() => _MakePostPageState();
}

class _MakePostPageState extends State<MakePostPage>{
  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String postTitle="";
  String content="";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("포스트 업로드 테스트"),),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '포스팅 제목',
              ),
              onChanged: (value){
                setState(() {
                  postTitle=value;
                });
              },
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '내용',
              ),
              maxLines: 10,
              onChanged: (value){
                setState(() {
                  content=value;
                });
              },
            ),
            ElevatedButton(
              onPressed: (){
                fireStore.collection('Posts').doc().set({
                  // doc안에 이름이 중첩되면 덮어써버림
                  // (set->update로 바꾸면 지정 doc찾아가 업뎃해줌)
                  // (set->delete로 바꾸면 지정 doc찾아가 삭제해줌)
                  "postTitle":postTitle,
                  "content":content,

                });
              },
              child: Text("업로드")
            )
          ],
        ),
      ),
    );
  }
}