import 'dart:ui';

import 'package:flutter/material.dart';

import 'model/JokeCard.dart';
import 'model/joke.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Демка анекдотов2222'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOffline;
  int _counter = 0;
  List<Joke> currentJokes = [];
  List<Joke> futureJokes = [];

  void getNewJokes() async {
    futureJokes = await RandomJokeBuilder().getRandomJokes();
  }

  void _incrementCounter() async {
    setState(() {
    currentJokes = null;
    getNewJokes();
    currentJokes = futureJokes;
      _counter++;

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.title),
            Text("           "),
            Text("$isOffline"),
          ],
        ),
      ),
      body: Container(
        child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if(currentJokes.length != 0)
              JokeCard(joke: currentJokes[5]),
            ],
          ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _incrementCounter();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
