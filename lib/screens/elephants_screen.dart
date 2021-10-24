import 'package:elephants_app/models/elephant.dart';
import 'package:flutter/material.dart';

class ElephantsScreen extends StatelessWidget  {
  const ElephantsScreen({Key? key, required this.todo}) : super(key: key);
  final elephant todo;

 // @override
  //_ElephantsScreenState createState() => _ElephantsScreenState();
//}

//class _ElephantsScreenState extends State<ElephantsScreen> {


  @override
  Widget build(BuildContext context) {
    // final todo = ModalRoute.of(context)!.settings.arguments as elephant;

    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.index.toString()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.name),
      ),
    );
  }
}

