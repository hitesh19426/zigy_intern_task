import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/services/remote_services.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  void addUser() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My PostPage'),
      ),
      body: ElevatedButton(
        child: const Text('Add User'),
        onPressed: () async {
          var data = {
            'name': 'Hitesh Garg',
            'movies': ['I love reqres', 'I hate reqres'],
          };
          var response = await RemoteServices().postData(data);
          if (response == null) {
            debugPrint('post request failed');
          } else {
            debugPrint('post request succeeded');
            debugPrint(response);
          }
        },
      ),
    );
  }
}
