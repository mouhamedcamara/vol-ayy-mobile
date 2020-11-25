import 'package:flutter/material.dart';
import 'package:projet_volaille/http_services/sale.dart';
import 'package:projet_volaille/models/sale.dart';
import 'package:intl/intl.dart';

class HistoryList extends StatefulWidget {
  HistoryList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final SaleService saleService = SaleService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: saleService.getSales(),
          builder: (BuildContext context, AsyncSnapshot<List<Sale>> snapshot) {
            if (snapshot.hasData) {
              List<Sale> saleList = snapshot.data;
              return ListView.builder(
                  itemCount: saleList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(111, 79, 29, 1))
                          // color: Color.fromRGBO(166, 124, 0, 0.9),
                          ),
                      width: double.infinity,
                      height: 180,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 15, top: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromRGBO(111, 79, 29, 1)),
                              image: DecorationImage(
                                  image: AssetImage("images/userImage1.jpeg"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  saleList[index].clientName,
                                  style: TextStyle(
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(saleList[index].location,
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(111, 79, 29, 1),
                                            fontSize: 13,
                                            letterSpacing: .3)),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.date_range,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        _formatDate(DateTime.parse(
                                            saleList[index].createdAt)),
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(111, 79, 29, 1),
                                            fontSize: 13,
                                            letterSpacing: .3)),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.confirmation_number,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(saleList[index].quantity.toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(111, 79, 29, 1),
                                            fontSize: 13,
                                            letterSpacing: .3)),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.monetization_on,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        _formatCurrency(
                                            saleList[index].unitPrice),
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(111, 79, 29, 1),
                                            fontSize: 13,
                                            letterSpacing: .3)),
                                  ],
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.monetization_on,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        _formatCurrency(
                                            saleList[index].totalPrice),
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(111, 79, 29, 1),
                                            fontSize: 13,
                                            letterSpacing: .3)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      backgroundColor: Color.fromRGBO(225, 211, 177, 1),
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
