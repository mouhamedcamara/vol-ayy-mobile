import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:projet_volaille/http_services/box.dart';
import 'package:projet_volaille/models/box.dart';
import 'package:projet_volaille/models/sale.dart';
import 'package:projet_volaille/models/user.dart';
import 'package:projet_volaille/screens/home/new_box.dart';
import 'package:projet_volaille/screens/home/update_box.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; //for date locale

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final BoxService boxService = BoxService();
  final User user;
  // final StreamController<int> indexcontroller;
  final Function onFinish;
  HomeScreen({@required this.user, @required this.onFinish});

  final today = DateTime.now();
  int total_amount = 0;

  @override
  Widget build(BuildContext context) {
    print("Les vendus et revenu");

    boxService.getAmount().then((value) {
      total_amount = value;
    });
    print(boxService.getAmount());
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
                    _formatCurrency(total_amount),
                    style: TextStyle(
                        color: Color.fromRGBO(111, 79, 29, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    // "Le ${DateFormat.yMMMMd('fr_FR').format(DateTime.now())}",
                    _formatDate(DateTime.now()),
                    // dateTime,
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
              child: FutureBuilder(
                future: boxService.getBoxs(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Box>> snapshot) {
                  if (snapshot.hasData) {
                    List<Box> boxes = snapshot.data;
                    return Container(
                      height: 335,
                      // color: Color.fromRGBO(166, 124, 0, 0.3),
                      padding: EdgeInsets.all(16.0),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          var death = 0;
                          var expense = 0;
                          boxService.getDeaths(boxes[index].id).then((value) {
                            death = value;
                          });

                          boxService.getExpense(boxes[index].id).then((value) {
                            expense = value;
                          });
                          return FutureBuilder<List<int>>(
                            future: boxService.getSales(boxes[index].id),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<int>> snaps) {
                              if (snaps.hasData) {
                                List<int> datas = snaps.data;

                                return ClipRRect(
                                    child: InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateBoxPage(
                                          box: boxes[index],
                                        ),
                                      )),
                                  child: Container(
                                    height: 330,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: Color.fromRGBO(
                                                111, 79, 29, 1))),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 70),
                                            child: Text(
                                              "${boxes[index].name}",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      111, 79, 29, 1),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold),
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
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),

                                                // Les Valeurs
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Text(
                                                      // "${boxes[index].age}",
                                                      "${today.difference(DateTime.parse(boxes[index].createdAt)).inDays}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      "${boxes[index].number}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      "$death",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      _formatCurrency(expense),
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      "${datas.first}",
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                      _formatCurrency(
                                                          datas.last),
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              111, 79, 29, 1),
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold),
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
                              } else {
                                return Center(
                                    child: CircularProgressIndicator(
                                  backgroundColor: Colors.red,
                                ));
                              }
                            },
                          );
                        },
                        itemCount: boxes.length,
                        viewportFraction: 0.8,
                        scale: 0.9,
                        pagination: SwiperPagination(
                            builder: DotSwiperPaginationBuilder(
                                color: Color.fromRGBO(111, 79, 29, 1),
                                activeColor: Colors.white)),
                      ),
                    );
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    ));
                  }
                },
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
              builder: (context) => NewBoxPage(
                user: user,
              ),
            )),
        // {
        //   onFinish();
        // },
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

String _formatCurrency(int amount) {
  var f = new NumberFormat.currency(
      locale: "fr-FR", symbol: "Fcfa", decimalDigits: 0);
  return '${f.format(amount)}';
}

String _formatDate(DateTime date) {
  final format = DateFormat('dd MMMM yyyy');
  return format.format(date);
}
