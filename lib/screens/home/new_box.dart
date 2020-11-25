import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projet_volaille/http_services/box.dart';
import 'package:projet_volaille/http_services/expense.dart';
import 'package:projet_volaille/models/box.dart';
import 'package:projet_volaille/models/expense.dart';
import 'package:projet_volaille/models/user.dart';

class NewBoxPage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login7.dart";
  final User user;
  NewBoxPage({@required this.user});
  @override
  _NewBoxPageState createState() => _NewBoxPageState();
}

class _NewBoxPageState extends State<NewBoxPage> {
  DateTime selectedDate = DateTime.now();

  Box _box;
  final BoxService boxService = BoxService();
  final ExpenseService expenseService = ExpenseService();

  TextEditingController _controller = TextEditingController();
  final TextEditingController _boxNameController = TextEditingController();
  final TextEditingController _boxNumberController = TextEditingController();
  final TextEditingController _boxExpenseController = TextEditingController();

  /// This decides which day will be enabled
  /// This will be called every time while displaying day in calender.
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return buildCupertinoDatePicker(context);
    }
  }

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
      backgroundColor: Color.fromRGBO(225, 211, 177, 1),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: 300,
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
                  height: 300,
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
                        height: 40,
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
                        "Vol'Ayy",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 300,
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
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Colors.deepOrange,
                controller: _boxNameController,
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Colors.deepOrange,
                controller: _boxNumberController,
                decoration: InputDecoration(
                    hintText: "Nombre initial",
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
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: Colors.deepOrange,
                controller: _boxExpenseController,
                decoration: InputDecoration(
                    hintText: "Dépense initiale",
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
            height: 35,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color.fromRGBO(111, 79, 29, 1)),
                child: FlatButton(
                  child: Text(
                    "Créer la box",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  onPressed: () async {
                    final String name = _boxNameController.text;
                    final int number = int.parse(_boxNumberController.text);
                    final int expense = int.parse(_boxExpenseController.text);
                    final String userId = widget.user.id;

                    final box = Box(
                        userId: userId,
                        name: name,
                        number: number,
                        expense: expense);

                    final result = await boxService.createBox(box);
                    print("La box a créée");

                    // print(result.toJson());

                    if (result != null) {
                      final firstExpense = Expense(
                          boxId: result.id,
                          amount: expense,
                          description: "Dépenses initiales");
                      final expResult =
                          await expenseService.createExpense(firstExpense);

                      final title = 'Fait';
                      final text = (expResult != null)
                          ? 'Box créée avec succés'
                          : 'Un probléme est survenu';

                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(title),
                                content: Text(text),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ));
                    }

                    setState(() {
                      _box = box;
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }

  // Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 32),
  //           child: Material(
  //             elevation: 2.0,
  //             borderRadius: BorderRadius.all(Radius.circular(30)),
  //             child: TextField(
  //               onTap: () => _selectDate(context),
  //               cursorColor: Colors.deepOrange,
  //               controller: _controller,
  //               decoration: InputDecoration(
  //                   hintText: "Date de naissance",
  //                   prefixIcon: Material(
  //                     elevation: 0,
  //                     borderRadius: BorderRadius.all(Radius.circular(30)),
  //                     child: Icon(
  //                       Icons.data_usage,
  //                       color: Color.fromRGBO(111, 79, 29, 1),
  //                     ),
  //                   ),
  //                   border: InputBorder.none,
  //                   contentPadding:
  //                       EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
  //             ),
  //           ),
  //         ),
  // IOS DatePicker

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != selectedDate)
                  setState(() {
                    selectedDate = picked;

                    var date = DateFormat.yMMMMd('fr_FR').format(selectedDate);

                    _controller.text = "$date";
                  });
              },
              initialDateTime: selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  // Android DatePicker

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      selectableDayPredicate: _decideWhichDayToEnable,
      helpText: 'Select booking date',
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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
