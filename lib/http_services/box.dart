import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_volaille/globals.dart';
import 'package:projet_volaille/models/api_response.dart';
import 'package:projet_volaille/models/box.dart';
import 'package:projet_volaille/models/death.dart';
import 'package:projet_volaille/models/expense.dart';
import 'package:projet_volaille/models/sale.dart';

class BoxService {
  final String boxURL = "https://volayy.herokuapp.com/api/box";
  final String accountURL = "https://volayy.herokuapp.com/api/amount";

  Future<Box> createBox(Box box) async {
    final response = await http.post(boxURL + '/create',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(box.toJson()));

    if (response.statusCode == 201) {
      final String responseString = response.body;
      print(response);
      return boxModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return boxModelFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<List<Box>> getBoxs() async {
    http.Response res = await http.get(boxURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body.asMap());
      List<Box> posts = body
          .map(
            (dynamic item) => Box.fromJson(item),
          )
          .toList();
      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<int> getAmount() async {
    http.Response res = await http.get(accountURL);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      int amount = 0;
      body.forEach((element) {
        var el = Account.fromJson(element);
        theAmount = el;
        amount = el.amount;
      });
      return amount;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<Account> updateAccountAdd(Account account) async {
    final response = await http.put(
        accountURL + '/${theAmount.id}/update_to_add',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(account.toJson()));

    if (response.statusCode == 201) {
      final String responseString = response.body;
      print(response);
      return accountModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return accountModelFromJson(responseString);
    } else {
      print("Ça c trés mal passer");
      print("Le code: ${response.statusCode}  , Le body: ${response.body}");
      return null;
    }
  }

  Future<Account> updateAccountSubstract(Account account) async {
    final response = await http.put(
        accountURL + '/${theAmount.id}/update_to_substract',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(account.toJson()));

    if (response.statusCode == 201) {
      final String responseString = response.body;
      print(response);
      return accountModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return accountModelFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<List<Expense>> getExpenses(String id) async {
    http.Response res = await http.get(boxURL + "/expenses/$id");

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

  Future<int> getExpense(String id) async {
    http.Response res = await http.get(boxURL + "/expenses/$id");

    print("Can get expenses:");
    print(res.statusCode);
    print(res.body);

    int expense = 0;

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      body.forEach((element) {
        var exp = Expense.fromJson(element);
        expense += exp.amount;
      });

      print("Les depenses");
      print(expense);
      return expense;
    } else {
      throw "Can't get sales.";
    }
  }

  Future<int> getDeaths(String id) async {
    http.Response res = await http.get(boxURL + "/deaths/$id");

    print("Can get expenses:");
    print(res.statusCode);
    print(res.body);

    var number = 0;

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      body.forEach((element) {
        var death = Death.fromJson(element);
        number += death.number;
      });

      print("Les Décés");
      print(number);
      return number;
    } else {
      throw "Can't get deaths.";
    }
  }

  Future<List<int>> getSales(String id) async {
    http.Response res = await http.get("$boxURL/sales/$id");

    int revenu = 0;
    int vendus = 0;

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      body.forEach((element) {
        var sale = Sale.fromJson(element);
        revenu += sale.totalPrice;
        vendus += sale.quantity;
      });
      List<int> datas = [vendus, revenu].toList();
      return datas;
    } else {
      throw "Can't get posts.";
    }
  }
}
