import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_volaille/screens/chats/components/chat.dart';
import 'package:projet_volaille/screens/chats/models/chat_users.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Badou Ba",
        secondaryText: "Alors nakamou",
        image: "images/userImage1.jpeg",
        time: "Maintenant"),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "That's Great",
        image: "images/userImage2.jpeg",
        time: "Hier"),
    ChatUsers(
        text: "Malick Fall",
        secondaryText: "Affaire yi matna deh",
        image: "images/userImage3.jpeg",
        time: "31 Mars"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(166, 124, 0, 0.3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Rechercher...",
                hintStyle: TextStyle(color: Colors.grey.shade400),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 16),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatUsersList(
                text: chatUsers[index].text,
                secondaryText: chatUsers[index].secondaryText,
                image: chatUsers[index].image,
                time: chatUsers[index].time,
                isMessageRead: (index == 0 || index == 3) ? true : false,
              );
            },
          ),
        ],
      ),
    );
  }
}
