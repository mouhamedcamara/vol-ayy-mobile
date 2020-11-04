import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SaleScreen extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";
  @override
  _SaleScreenState createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  final customerController = TextEditingController();
  final qtyController = TextEditingController();
  final priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    customerController.dispose();
    qtyController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(166, 124, 0, 0.3),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(111, 79, 29, 1),
                    Color.fromRGBO(166, 124, 0, 1)
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(166, 124, 0, 1),
                    Color.fromRGBO(111, 79, 29, 1)
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.fastfood,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "125 individus restants",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(111, 79, 29, 1),
                    Color.fromRGBO(166, 124, 0, 1)
                  ])),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: customerController,
                keyboardType: TextInputType.text,
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(111, 79, 29, 1),
                decoration: InputDecoration(
                    hintText: "Nom de la box",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(111, 79, 29, 1),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: customerController,
                keyboardType: TextInputType.text,
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(111, 79, 29, 1),
                decoration: InputDecoration(
                    hintText: "Nom du client",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.person,
                        color: Color.fromRGBO(111, 79, 29, 1),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: customerController,
                keyboardType: TextInputType.text,
                onChanged: (String value) {},
                cursorColor: Color.fromRGBO(111, 79, 29, 1),
                decoration: InputDecoration(
                    hintText: "Lieu de la vente",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(111, 79, 29, 1),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: qtyController,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  print(returnTotalAmount());
                },
                cursorColor: Color.fromRGBO(111, 79, 29, 1),
                decoration: InputDecoration(
                    hintText: "Quantité",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.confirmation_number,
                        color: Color.fromRGBO(111, 79, 29, 1),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  priceController.text = value;
                },
                cursorColor: Color.fromRGBO(111, 79, 29, 1),
                decoration: InputDecoration(
                    hintText: "Prix unitaire: 3.000",

                    // labelText: "1.850",
                    prefixIcon: Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Icon(
                        Icons.monetization_on,
                        color: Color.fromRGBO(111, 79, 29, 1),
                      ),
                    ),
                    suffix: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Text("Cfa",
                            style: TextStyle(
                                color: Color.fromRGBO(111, 79, 29, 1)))),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        // width: 150,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            color: Color.fromRGBO(111, 79, 29, 1)),
                        child: FlatButton(
                          child: Text(
                            "Vendre",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  _buildAboutDialog(context),
                            );
                            print(customerController.text);
                          },
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return new AlertDialog(
      title: const Center(
        child: Text(
          'Résumé de la vente',
          style: TextStyle(
              color: Color.fromRGBO(111, 79, 29, 1),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: new Container(
        height: 190,
        padding: EdgeInsets.only(left: 1.0, top: 30, bottom: 0),
        child: Row(
          children: <Widget>[
            // Les Attributs
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Client: ",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Quantité: ",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Prix Unitaire",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Prix Total: ",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // Les Valeurs
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Ndeye Yacine Ndiaye",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "20",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "2500",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "546.900 CFA",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: 200,
          margin: EdgeInsets.only(right: 35, bottom: 50, top: 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              color: Color.fromRGBO(111, 79, 29, 1)),
          child: FlatButton(
            child: Text(
              "Valider",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onPressed: () {
              print(customerController.text);
            },
          ),
        ),
      ],
    );
  }

  Container totalAmount() {
    return Container(
      margin: EdgeInsets.only(left: 15),
      // padding: EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Total: ',
              style: TextStyle(
                  color: Color.fromRGBO(111, 79, 29, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              // "${returnTotalAmount()} Cfa",
              '125.000 Cfa',
              style: TextStyle(
                  color: Color.fromRGBO(111, 79, 29, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  String returnTotalAmount() {
    int totalAmount = 0;

    // State() {
    //   totalAmount = int.parse(qtyController.text) * 1850;
    // }

    totalAmount = int.parse(qtyController.text) * 1850;

    return totalAmount.toString();
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
