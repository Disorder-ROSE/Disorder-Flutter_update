import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreatePostPage extends StatefulWidget{
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage>{
  FirebaseFirestore fireStore=FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  String postTitle="";
  String name="";
  String content="";

  //16자리의 숫자포함 랜덤글자 생성하는 코드
  String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("게시글 작성하기"),),
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
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '아이디',
              ),
              maxLines: 1,
              onChanged: (value){
                setState(() {
                  name=value;
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
                  String postKey=getRandomString(16);
                  fireStore.collection('posts').doc(postKey).set({
                    "key":postKey,
                    "title":postTitle,
                    "explain":content,
                    "authorName":name,
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