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
            return UserCard(user: users![index]);
          },
        ),
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar)),
            title: Text('${user.id} : ${user.firstName}  ${user.lastName}'),
            subtitle: Text('Email: ${user.email}'),
          ),
        ],
      ),
    );
  }
}
