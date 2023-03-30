// ignore: file_names
import 'dart:developer';

import 'package:bloc01/statefull/secondPage.dart';
import 'package:flutter/material.dart';

class CounterWithStateFull extends StatelessWidget {
  const CounterWithStateFull({super.key});

  @override
  Widget build(BuildContext context) {
    log('build ishtedi');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
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
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () async {
                final data = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(san: _counter),
                  ),
                );
                setState(() {
                  _counter = data ?? 0;
                });
              },
              child: const Text('Go to second page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
