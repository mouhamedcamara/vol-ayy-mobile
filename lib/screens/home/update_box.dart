import 'package:flutter/material.dart';
import 'package:projet_volaille/screens/auth/resetpassword.dart';
import 'package:projet_volaille/screens/home/box_expenses.dart';

class UpdateBoxPage extends StatefulWidget {
  @override
  _UpdateBoxPageState createState() => _UpdateBoxPageState();
}

class _UpdateBoxPageState extends State<UpdateBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(225, 211, 177, 1),
      appBar: AppBar(
        title: Text("VOL'AYY",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: Color.fromRGBO(166, 124, 0, 1),
        elevation: 5.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Box N° 122",
              style: TextStyle(
                  color: Color.fromRGBO(111, 79, 29, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 55,
          ),
          Padding(
            padding: EdgeInsets.only(left: 45),
            child: Container(
              child: Row(
                children: <Widget>[
                  // Les Attributs
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Age: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nombre: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nombre décès: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Dépenses: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Nombre vendu: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Revenus: ",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  // Les Valeurs
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "24",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "350",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "23",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "546.900 CFA",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "245",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "546.900 CFA",
                        style: TextStyle(
                            color: Color.fromRGBO(111, 79, 29, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromRGBO(111, 79, 29, 1)),
                child: FlatButton(
                    child: Text(
                      "Ajouter une dépense",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildOutlayDialog(context),
                      );
                    }),
              )),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  color: Color.fromRGBO(111, 79, 29, 1)),
              child: FlatButton(
                  child: Text(
                    "Enregistrer un décés",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildSaveDeathDialog(context),
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExpenseList(),
                  )),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Voir la liste des dépenses de cette box",
                  style: TextStyle(
                      color: Color.fromRGBO(111, 79, 29, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }

  Widget _buildSaveDeathDialog(BuildContext context) {
    return new AlertDialog(
      title: const Center(
        child: Text(
          'Enregistrement décés',
          style: TextStyle(
              color: Color.fromRGBO(111, 79, 29, 1),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: new Container(
        // height: 190,
        padding: EdgeInsets.only(left: 1.0, top: 30, bottom: 0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: TextField(
              // controller: qtyController,
              keyboardType: TextInputType.number,
              cursorColor: Color.fromRGBO(111, 79, 29, 1),
              decoration: InputDecoration(
                  hintText: "Nombre",
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildOutlayDialog(BuildContext context) {
    return new AlertDialog(
      title: const Center(
        child: Text(
          'Ajouter une dépense',
          style: TextStyle(
              color: Color.fromRGBO(111, 79, 29, 1),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      content: new Container(
        height: 190,
        // width: 10,
        // color: Colors.red,
        padding: EdgeInsets.only(left: 1.0, top: 30, bottom: 0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {},
                  cursorColor: Color.fromRGBO(111, 79, 29, 1),
                  decoration: InputDecoration(
                      hintText: "Montant",
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
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Color.fromRGBO(111, 79, 29, 1),
                  decoration: InputDecoration(
                      hintText: "Produits",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.description,
                          color: Color.fromRGBO(111, 79, 29, 1),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
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
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
