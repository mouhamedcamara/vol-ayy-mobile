import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projet_volaille/screens/chats/modules/chat_page.dart';
import 'package:projet_volaille/screens/history/history.dart';
import 'package:projet_volaille/screens/home/components/bottombar.dart';
import 'package:projet_volaille/screens/home/homeScreen.dart';
import 'package:projet_volaille/screens/sale/sale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  static final String path = "lib/src/pages/misc/navybar.dart";
  // final User user;

  // const Home({Key key, this.user}) : super(key: key);

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

  // FirebaseAuth _auth = FirebaseAuth.instance;

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexcontroller = StreamController<int>.broadcast();
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
          HomeScreen(),
          SaleScreen(),
          HistoryList(),
          // ChatPage(),
        ],
      ),
      bottomNavigationBar: StreamBuilder<Object>(
          initialData: 0,
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
                // FancyBottomNavigationItem(
                //     icon: Icon(Icons.chat_bubble), title: Text('Chats')),
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
