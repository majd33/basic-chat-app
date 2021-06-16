import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMsgField extends StatefulWidget {
  @override
  _NewMsgFieldState createState() => _NewMsgFieldState();
}

class _NewMsgFieldState extends State<NewMsgField> {

  final _controller= TextEditingController();
  String _enteredMsg="";

  _sendMsg()async{
    FocusScope.of(context).unfocus();

    final user= FirebaseAuth.instance.currentUser;
    var userData=await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    FirebaseFirestore.instance.collection('chat').add(
        {'text':_enteredMsg, 'createdAt': Timestamp.now(),
          'username': userData['username'],
          'userId': user.uid, 'user_image':userData['image_url']
        });

    _controller.clear();
    setState(() {
      _enteredMsg="";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(child: TextField(
            autocorrect: true,
            enableSuggestions: true,
            textCapitalization: TextCapitalization.sentences,
            controller: _controller,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                labelText: 'Send a Message ...'),
            onChanged: (value){
              setState(() {
                _enteredMsg=value;
              });
            },
          )),
          IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed: _enteredMsg.trim().isEmpty?null:_sendMsg),
        ],
      ),
    );
  }
}
