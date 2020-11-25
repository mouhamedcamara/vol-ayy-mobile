import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_volaille/models/expense.dart';

class ExpenseService {
  final String expenseURL = "https://volayy.herokuapp.com/api/expenses";

  Future<List<Expense>> getExpenses(String id) async {
    http.Response res = await http.get(expenseURL);

    print("Can get expenses:");
    print(res.statusCode);
    print(res.body);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      print("Le Resultat");
      print(body.asMap());
      List<Expense> expenses = body
          .map(
            (dynamic item) => Expense.fromJson(item),
          )
          .toList();
      print("Les depenses");
      print(expenses);
      return expenses;
    } else {
      throw "Can't get sales.";
    }
  }

  Future<Expense> createExpense(Expense expense) async {
    final response = await http.post(expenseURL + '/create',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(expense.toJson()));

    if (response.statusCode == 201) {
      print(response.statusCode);
      print("Y a erreur");
      final String responseString = response.body;
      print(response);
      return expenseModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return expenseModelFromJson(responseString);
    } else {
      print("Y a erreur bis");
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
}
