import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_volaille/models/death.dart';

class DeathService {
  final String deathURL = "https://volayy.herokuapp.com/api/death";

  Future<List<Death>> getDeaths(String id) async {
    http.Response res = await http.get(deathURL);

    print("Can get expenses:");
    print(res.statusCode);
    print(res.body);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      print("Le Resultat");
      print(body.asMap());
      List<Death> deaths = body
          .map(
            (dynamic item) => Death.fromJson(item),
          )
          .toList();
      print("Les deces");
      print(deaths);
      return deaths;
    } else {
      throw "Can't get deaths.";
    }
  }

  Future<Death> createDeath(Death death) async {
    final response = await http.post(deathURL + '/create',
        headers: <String, String>{"Content-Type": "application/json"},
        body: json.encode(death.toJson()));

    print(death.number);
    if (response.statusCode == 201) {
      print(response.statusCode);
      print("Y a erreur");
      final String responseString = response.body;
      print(response);
      return deathModelFromJson(responseString);
    } else if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return deathModelFromJson(responseString);
    } else {
      print("Y a erreur bis");
      print(response.statusCode);
      print(response.body);
      return null;
    }
  }
}
