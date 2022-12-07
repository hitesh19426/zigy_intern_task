import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<User>?> getUsers() async {
    var client = http.Client();
    var uri = Uri.parse('https://reqres.in/api/users?page=2');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      debugPrint(json);



      return usersFromJson(json);
    }
    return null;
  }
}
