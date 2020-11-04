import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  ExpenseList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final List<Map> expenseLists = [
    {
      "description": "Ndeye Astou Ndour",
      "total_amount": "250000",
      "date": "12 Octobre 2020",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "description": "Ndeye Astou Ndour",
      "total_amount": "250000",
      "date": "12 Octobre 2020",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "description": "Ndeye Astou Ndour",
      "total_amount": "250000",
      "date": "12 Octobre 2020",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "description": "Ndeye Astou Ndour",
      "total_amount": "250000",
      "date": "12 Octobre 2020",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
  ];

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
      body: ListView.builder(
          itemCount: expenseLists.length,
          itemBuilder: (BuildContext context, int index) {
            return buildList(context, index);
          }),
      backgroundColor: Color.fromRGBO(225, 211, 177, 1),
    );
  }

  Widget buildList(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 1, color: Color.fromRGBO(111, 79, 29, 1))
          // color: Color.fromRGBO(166, 124, 0, 0.9),
          ),
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15, top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(width: 3, color: Color.fromRGBO(111, 79, 29, 1)),
              image: DecorationImage(
                  image: NetworkImage(expenseLists[index]['logoText']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  expenseLists[index]['description'],
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
                      Icons.date_range,
                      color: Color.fromRGBO(111, 79, 29, 1),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(expenseLists[index]['date'],
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
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
                    Text(expenseLists[index]['total_amount'] + '  CFA',
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
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
  }
}
