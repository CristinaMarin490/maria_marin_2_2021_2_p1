import 'package:elephants_app/models/elephant.dart';
import 'package:elephants_app/screens/elephant_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(ElephantApp());

class ElephantApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elephants',
      home: ElephantScreen(),
    );
  }
}

