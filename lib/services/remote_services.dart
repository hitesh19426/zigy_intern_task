import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/user.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  var client = http.Client();

  Future<List<User>?> getUsers() async {
    var uri = Uri.parse('https://reqres.in/api/users?page=2');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      debugPrint(json);
      return usersFromJson(json);
    }
    return null;
  }

  Future<dynamic> postData(dynamic object) async {
    var uri = Uri.parse('https://reqres.in/api/users');
    var payload = json.encode(object);
    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await client.post(uri, body: payload, headers: headers);
    if (response.statusCode == 201 || response.statusCode == 200) {
      return response.body;
    }

    return null;
  }
}
