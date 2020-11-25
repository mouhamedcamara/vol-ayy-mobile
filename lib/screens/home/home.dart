import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_volaille/globals.dart';
import 'package:projet_volaille/models/user.dart';
// import 'package:projet_volaille/screens/chats/modules/chat_page.dart';
import 'package:projet_volaille/screens/history/history.dart';
import 'package:projet_volaille/screens/home/components/bottombar.dart';
import 'package:projet_volaille/screens/home/homeScreen.dart';
import 'package:projet_volaille/screens/sale/sale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  static final String path = "lib/src/pages/misc/navybar.dart";

  final User user;
  final String token;
  Home({this.user, this.token});

  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  void dispose() {
    indexcontroller.close();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    pageController = pageController;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("VOL'AYY",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromRGBO(166, 124, 0, 1),
        elevation: 5.0,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          indexcontroller.add(index);
        },
        controller: pageController,
        children: <Widget>[
          HomeScreen(
            user: widget.user,
            onFinish: () {
              index = 2;
              setState(() {
                indexcontroller.add(index);
                pageController.jumpToPage(index);
              });
            },
          ),
          SaleScreen(
            user: widget.user,
          ),
          HistoryList(),
          // ChatPage(),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
          initialData: index,
          stream: indexcontroller.stream,
          builder: (context, snapshot) {
            int cIndex = snapshot.data;
            return FancyBottomNavigation(
              currentIndex: cIndex,
              items: <FancyBottomNavigationItem>[
                FancyBottomNavigationItem(
                    icon: Icon(Icons.home), title: Text('Accueil')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.point_of_sale), title: Text('Vendre')),
                FancyBottomNavigationItem(
                    icon: Icon(Icons.history), title: Text('Historique')),
              ],
              onItemSelected: (int value) {
                indexcontroller.add(value);
                pageController.jumpToPage(value);
              },
            );
          }),
    );
  }
}
