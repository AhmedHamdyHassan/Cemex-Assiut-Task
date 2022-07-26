import 'dart:convert';

import 'package:cemex_task/Models/truck_model.dart';
import 'package:cemex_task/Models/user_model.dart';
import 'package:http/http.dart' as http;

class ConnectWithCemexAPI {
  static const String apiURL =
      'http://20.86.97.165/Tire/api/AccountApi/Trucks/';

  static Future<List<dynamic>> getDataFromAPI(
      String email, String password) async {
    List<dynamic> finalDataFromAPI = [];
    var url = Uri.parse(apiURL);
    final response = await http.post(
      url,
      body: json.encode({
        'email': email,
        'password': password,
      }),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      UserModel user = UserModel.fromJson(responseBody['data']);
      final trucksResonseBody = responseBody['trucks'] as List<dynamic>;
      final List<TruckModel> trucks =
          trucksResonseBody.map((e) => TruckModel.fromJson(e)).toList();
      finalDataFromAPI.add(user);
      finalDataFromAPI.add(trucks);
    } else {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['message']);
    }
    return finalDataFromAPI;
  }
}
