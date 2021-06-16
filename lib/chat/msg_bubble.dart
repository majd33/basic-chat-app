import 'package:flutter/material.dart';

class MsgBubble extends StatelessWidget {

  final Key key;
  final String msg, username, userImage;
  bool isMe;
  MsgBubble(this.msg, this.username, this.userImage,this.isMe, {this.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Row(
          mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: isMe? Theme.of(context).primaryColor : Colors.grey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: !isMe? Radius.circular(0):Radius.circular(15),
                      bottomRight: isMe? Radius.circular(0):Radius.circular(15),
                    )
                ),
                width: 140,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
                  children: [
                    Text("$username",
                      style: TextStyle(color: isMe? Colors.white: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      msg,
                      style: TextStyle(color: isMe? Colors.white: Colors.black),
                      textAlign: isMe? TextAlign.end: TextAlign.start,
                    ),
                  ],
                )

            )
          ],
        ),
        Positioned(
          top: 0,
            left: !isMe?120:null,
            right:isMe?120:null,
            child: CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        )),
      ],
      overflow: Overflow.visible,

    );
  }
}
