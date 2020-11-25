import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_volaille/models/api_response.dart';
import 'package:projet_volaille/models/sale.dart';

class SaleService {
  final String saleURL = "https://volayy.herokuapp.com/api/sale";

  Future<List<Sale>> getSales() async {
    http.Response res = await http.get(saleURL);

    print("Can get sales:");
    print(res.statusCode);
    print(res.body);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      print("Le Resultat");
      print(body.asMap());
      List<Sale> posts = body
          .map(
            (dynamic item) => Sale.fromJson(item),
          )
          .toList();
      print("Les ventes");
      print(posts);
      return posts;
    } else {
      throw "Can't get sales.";
    }
  }

  Future<void> deleteSale(int id) async {
    http.Response res = await http.delete("$saleURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Can't delete sale.";
    }
  }

  Future<Sale> createSale(Sale sale) async {
    final response = await http.post(saleURL + '/create',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(sale.toJson()));

    if (response.statusCode == 201) {
      print(response.statusCode);
      print("Y a erreur");
      final String responseString = response.body;
      print(response);
      return saleModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return saleModelFromJson(responseString);
    } else {
      print("Y a erreur bis");
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }

  // Future<APIResponse<bool>> createBox(Box box) {
  //   print("La box");
  //   print(json.encode(box));
  //   return http
  //       .post(boxURL + '/create',
  //           headers: <String, String>{"Content-Type": "application/json"},
  //           body: json.encode(box.toJson()))
  //       .then((data) {
  //     if (data.statusCode == 200) {
  //       print("Ça c bien passer");
  //       print(data);
  //       print("Ça c bien passer");
  //       return APIResponse<bool>(data: true, error: false);
  //     }
  //     print("Ça c mal passer");
  //     print(data.body);
  //     print(data.statusCode);
  //     print("Ça c mal passer");
  //     return APIResponse<bool>(error: true, errorMessage: 'An error occured');
  //   }).catchError((_) =>
  //           APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  // }
}
