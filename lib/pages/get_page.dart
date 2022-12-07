import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user.dart';

import '../services/remote_services.dart';

class GetPage extends StatefulWidget {
  const GetPage({super.key});

  @override
  State<GetPage> createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  List<User>? users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getUsers();
  }

  getUsers() async {
    users = await RemoteServices().getUsers();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Page'),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: users?.length,
          itemBuilder: (context, index) {
            return Text(users![index].firstName);
          },
        ),
      ),
    );
  }
}
