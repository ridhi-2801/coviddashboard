import 'package:flutter/material.dart';
import 'ui/state_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: StateList(),
      ),
    );
  }
}