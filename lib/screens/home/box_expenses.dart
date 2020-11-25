import 'package:flutter/material.dart';
import 'package:projet_volaille/http_services/box.dart';
import 'package:projet_volaille/http_services/expense.dart';
import 'package:projet_volaille/models/box.dart';
import 'package:projet_volaille/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseList extends StatefulWidget {
  ExpenseList({@required this.box});
  static final String path = "lib/src/pages/lists/list2.dart";
  final Box box;

  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final ExpenseService expenseService = ExpenseService();
  final BoxService boxService = BoxService();

  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VOL'AYY",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromRGBO(166, 124, 0, 1),
        elevation: 5.0,
      ),
      body: FutureBuilder(
          future: boxService.getExpenses(widget.box.id),
          builder:
              (BuildContext context, AsyncSnapshot<List<Expense>> snapshot) {
            if (snapshot.hasData) {
              List<Expense> expenses = snapshot.data;

              return ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(111, 79, 29, 1))
                          // color: Color.fromRGBO(166, 124, 0, 0.9),
                          ),
                      width: double.infinity,
                      height: 100,
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
                            margin: EdgeInsets.only(right: 15, top: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromRGBO(111, 79, 29, 1)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _formatCurrency(expenses[index].amount),
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
                                      Icons.description,
                                      color: Color.fromRGBO(111, 79, 29, 1),
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(expenses[index].description,
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
                                            expenses[index].createdAt)),
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
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));
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
