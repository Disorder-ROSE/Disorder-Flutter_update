import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community/pages/postclick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/createpostpage.dart';
import '../pages/postclick.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}) : super(key:key);
  @override
  _HomeScreenState createState()=>_HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  CollectionReference product = FirebaseFirestore.instance.collection('posts');
  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        StreamBuilder(
          stream: product.snapshots(),
          builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot> streamSnapshot){
          if(streamSnapshot.hasData){
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index){
                final DocumentSnapshot documentSnapshot=streamSnapshot.data!.docs[index];
                /*return OutlinedButton(
                  onPressed: (){
                    //return PostClick();
                  },
                  //margin: EdgeInsets.only(left:16,right:16,top:8,bottom:8),
                  child:ListTile(
                    title:Text(documentSnapshot['title']),
                    subtitle: Text(documentSnapshot['authorName']),
                  ),
                );*/
                return GestureDetector(
                  onTap: (){
                    Get.to(PostClick());
                  },
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
        ),
        /*Container(
          child:ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext context, int index){
              return PostCard(
                number: index,
              );
            },
          )
        ),*/
        GestureDetector(
          onTap: (){
            Get.to(CreatePostPage());
          },
          child: Container(
            margin: EdgeInsets.all(15),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: Colors.blueAccent,
            ),
            child: Icon(Icons.add),
          ),
        )

      ],
    );
  }
}