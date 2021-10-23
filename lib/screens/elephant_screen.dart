import 'package:elephants_app/helpers/constans.dart';
import 'package:elephants_app/models/elephant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ElephantScreen extends StatefulWidget {
  const ElephantScreen({ Key? key }) : super(key: key);

  @override
  _ElephantScreenState createState() => _ElephantScreenState();
}

class _ElephantScreenState extends State<ElephantScreen> {
  List<elephant> _elephants = [];

  @override
  void initState() {
     super.initState();
     _getElephants();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elefantes'),
      ),
      body: Center(
        child: Text('elefantes'),
      ),
      
    );
  }

  void _getElephants() async {
    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    print(response.body);
  }
}