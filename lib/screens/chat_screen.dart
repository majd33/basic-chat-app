import 'package:chat_application/chat/messages.dart';
import 'package:chat_application/chat/msg_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class chatscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Chat"),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: Icon(Icons.more_vert, color: Colors.white,),
            items:[
              DropdownMenuItem(
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Logout")
                  ],),
                value: 'logout',)
            ],
            onChanged: (value){
              if(value=='logout')
                FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body:Container(
        child: Column(
          children: [
            Expanded(child: Message(),),
            NewMsgField(),
          ],
        ),
      ),

    );
  }


}