import 'package:flutter/material.dart';

import 'type_matching_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the Home Page widget.
        '/': (context) => MyHomePage(title: 'Game Help Hub'),
        // When navigating to the "/second" route, build the TypeMatchingPage widget.
        '/second': (context) => TypeMatchingPage(title: 'Type Matching'),
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Help Hub',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Game Help Hub'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  void _incrementCounter() {
    setState(() {
    });
  }

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
            Text(
              'Welcome to Game Help Hub!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text('Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {
                // Update the state of the app
                //
                // Then close the drawer
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Type Matching'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}
