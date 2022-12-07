import 'package:flutter/material.dart';
import 'pages/get_page.dart';
import 'pages/post_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.green),
        routes: {
          '/': (context) => const MyHomePage(title: 'My Home Page'),
          '/getPage': (context) => const GetPage(),
          '/postPage': (context) => const PostPage(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                debugPrint('Get route button clicked');
                Navigator.pushNamed(context, '/getPage');
              },
              child: const Text('Get route'),
            ),
            ElevatedButton(
              child: const Text('Post route'),
              onPressed: () {
                debugPrint('Post route button clicked');
                Navigator.pushNamed(context, '/postPage');
              },
            )
          ],
        ),
      ),
    );
  }
}
