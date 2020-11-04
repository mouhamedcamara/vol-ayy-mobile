import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  HistoryList({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _HistoryListState createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final List<Map> schoolLists = [
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
    {
      "name": "Ndeye Astou Ndour",
      "location": "Nord-Foire, Dakar",
      "date": "12 Octobre 2020",
      "qty": "100",
      "unit_amount": "2500",
      "total_amount": "250000",
      "logoText":
          "https://cdn.pixabay.com/photo/2017/03/16/21/18/logo-2150297_960_720.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: schoolLists.length,
          itemBuilder: (BuildContext context, int index) {
            return buildList(context, index);
          }),
      backgroundColor: Color.fromRGBO(166, 124, 0, 0.3),
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
      height: 180,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(right: 15, top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border:
                  Border.all(width: 3, color: Color.fromRGBO(111, 79, 29, 1)),
              image: DecorationImage(
                  image: NetworkImage(schoolLists[index]['logoText']),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  schoolLists[index]['name'],
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
                    Text(schoolLists[index]['location'],
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
                      Icons.date_range,
                      color: Color.fromRGBO(111, 79, 29, 1),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(schoolLists[index]['date'],
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
                      Icons.confirmation_number,
                      color: Color.fromRGBO(111, 79, 29, 1),
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(schoolLists[index]['qty'],
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
                    Text(schoolLists[index]['unit_amount'] + '  CFA',
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
                    Text(schoolLists[index]['total_amount'] + '  CFA',
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
