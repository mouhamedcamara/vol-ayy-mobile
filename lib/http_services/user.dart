import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_volaille/models/user.dart';

class UserService {
  final String userURL = "https://volayy.herokuapp.com/api/auth";

  Future<User> getUser(String token) async {
    http.Response res = await http.get(
      "$userURL/user",
      headers: <String, String>{"Authorization": "Bearer $token"},
    );
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      User user = User.fromJson(body);
      print("This is the user: ${user.name}");
      return user;
    } else {
      throw "Can't get the user.";
    }
  }

  Future<Login> login(User user) async {
    String username = user.phone;
    String password = user.password;
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    final response = await http.post(userURL + '/login',
        headers: <String, String>{
          "Content-Type": "application/json",
          "authorization": basicAuth
        });

    print("Le body: ${response.body}");
    print("Le code: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("Ça c bien passer");
      final String responseString = response.body;
      return loginFromJson(responseString);
    } else {
      return null;
    }
  }
}
