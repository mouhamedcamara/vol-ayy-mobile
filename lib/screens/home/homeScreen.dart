import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:projet_volaille/screens/home/new_box.dart';
import 'package:projet_volaille/screens/home/update_box.dart';

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
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
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 211, 177, 1),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(166, 124, 0, 0.3),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Solde Actuel",
                    style: TextStyle(
                        color: Color.fromRGBO(111, 79, 29, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "2.000.000 F.CFA",
                    style: TextStyle(
                        color: Color.fromRGBO(111, 79, 29, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    "27 Octobre 2020",
                    style: TextStyle(
                        color: Color.fromRGBO(111, 79, 29, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                height: 335,
                // color: Color.fromRGBO(166, 124, 0, 0.3),
                padding: EdgeInsets.all(16.0),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                        child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UpdateBoxPage(),
                          )),
                      child: Container(
                        height: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(111, 79, 29, 1))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: Text(
                                  "Box N° 2",
                                  style: TextStyle(
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    // Les Attributs
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Age: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Nombre: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Nombre décès: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Dépenses: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Nombre vendu: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "Revenus: ",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),

                                    // Les Valeurs
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          "24",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "350",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "23",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "546.900 CFA",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "245",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "546.900 CFA",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  111, 79, 29, 1),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                  itemCount: myList.length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          color: Color.fromRGBO(111, 79, 29, 1),
                          activeColor: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewBoxPage(),
            )),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(111, 79, 29, 1),
        elevation: 0,
      ),
    );
  }
}
