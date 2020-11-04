import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
      title: "Vendues",
      subtitle: "March, Wednesday",
      event: "3 Events",
      img: "assets/calendar.png");

  Items item2 = new Items(
    title: "A Livrer",
    subtitle: "Bocali, Apple",
    event: "4 Items",
    img: "assets/food.png",
  );

  Items item3 = new Items(
    title: "Restantes",
    subtitle: "Lucy Mao going to Office",
    event: "",
    img: "assets/map.png",
  );

  Items item4 = new Items(
    title: "Dépenses",
    subtitle: "Rose favirited your Post",
    event: "",
    img: "assets/festival.png",
  );

  Items item5 = new Items(
    title: "Ventes",
    subtitle: "Homework, Design",
    event: "4 Items",
    img: "assets/todo.png",
  );

  Items item6 = new Items(
    title: "Revenus",
    subtitle: "",
    event: "2 Items",
    img: "assets/setting.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 30, right: 30),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(166, 124, 0, 0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}
