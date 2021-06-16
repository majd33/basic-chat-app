
import 'package:chat_application/chat/msg_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots() ,
      builder: (ctx, snapshot){
        //1sKnNEe3F8TvzkEPk2wI  orderBy('createdAt', descending: true).
        if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: CircularProgressIndicator());
        }
        final docs=snapshot.data.docs;
        final user=FirebaseAuth.instance.currentUser;
        return ListView.builder(
          reverse: true,
          itemBuilder: (ctx,index)=> //Text(docs[index]['text']),docs[index]['username']   docs[index]['userId']==user.uid docs[index].documentID
              MsgBubble(docs[index]['text'], docs[index]['username'] ,docs[index]['user_image'],docs[index]['userId']==user.uid , key: ValueKey(docs[index].id)),
          itemCount: docs.length,);},
    );
  }
}
