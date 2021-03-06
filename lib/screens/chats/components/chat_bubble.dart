import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_volaille/screens/chats/models/chat_message.dart';
import 'package:projet_volaille/screens/chats/modules/chat_detail_page.dart';

// ignore: must_be_immutable
class ChatBubble extends StatefulWidget {
  ChatMessage chatMessage;
  ChatBubble({@required this.chatMessage});
  @override
  _ChatBubbleState createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Align(
        alignment: (widget.chatMessage.type == MessageType.Receiver
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (widget.chatMessage.type == MessageType.Receiver
                ? Color.fromRGBO(166, 124, 0, 1)
                : Color.fromRGBO(111, 79, 29, 1)),
          ),
          padding: EdgeInsets.all(16),
          child: Text(
            widget.chatMessage.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
