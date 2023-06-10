import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostClick extends StatefulWidget{
  const PostClick({Key? key}) : super(key:key);
  @override
  _PostClickState createState() => _PostClickState();
}

class _PostClickState extends State<PostClick>{
  CollectionReference product = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:Text("게시글"),),
      body: Container(
        child: Column(
          children: [
            Text('제목'),
            Text('아이디'),
            Text('내용'),


            /*StreamBuilder(
              stream: product.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> streamSnapshot){
                if(streamSnapshot.hasData){
                  return ListView.builder(
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        final DocumentSnapshot documentSnapshot=streamSnapshot.data!.docs[index];
                        return Card(
                          child:ListTile(
                            title:Text(documentSnapshot['title']),
                            subtitle: Text(documentSnapshot['authorName']),
                          ),
                        );
                      }
                  );
                }
                return CircularProgressIndicator();
              },
            ),*/

          ],
        ),
      ),
    );

  }
}