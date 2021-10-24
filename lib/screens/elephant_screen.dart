import 'dart:convert';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:elephants_app/components/loader_component.dart';
import 'package:elephants_app/helpers/constans.dart';
import 'package:elephants_app/models/elephant.dart';
import 'package:elephants_app/screens/elephants_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ElephantScreen extends StatefulWidget {
  const ElephantScreen({ Key? key }) : super(key: key);


  @override
  _ElephantScreenState createState() => _ElephantScreenState();
}

class _ElephantScreenState extends State<ElephantScreen> {
  List<elephant> _elephants = [];
  bool _showLoader = false;
  bool _isFiltered = false;
  String _search = '';


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
        actions: <Widget>[
          _isFiltered
          ? IconButton(
            onPressed: _removeFilter,
            icon: Icon(Icons.filter_none)
            )
          :IconButton(
            onPressed: _showFilter,
            icon: Icon(Icons.filter_alt)
            )
        ],
      ),
      body: Center(
        child: _showLoader ? LoaderComponent( text: 'Cargando'): _getContent(),
      ),
      
    );
  }

  void _getElephants() async {
    setState(() {
      _showLoader = true;
    });

    var url = Uri.parse(Constans.apiUrl);
    var response = await http.get(
      url,
      headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      },
    );
    setState(() {
      _showLoader = false;
    });

    var body = response.body;
    var decodedJson = jsonDecode(body);
    if(decodedJson != null) {
      for (var item in decodedJson){
        if(item.length == 12){
           _elephants.add(elephant.fromJson(item));
        } 
      }
    }
    print(_elephants);

  }

 
  Widget _getContent() {
    return _elephants.length == 0
    ? _noContent()
    : _getListView();
  }

 Widget _noContent() {
   return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
         _isFiltered
         ?'No hay elefantes con ese criterio de busqueda'
         : 'No se encontron elefantes.',
          style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
       ),
    ),
  );
 }

 Widget _getListView() {
   return ListView(
     children: _elephants.map((e) {
       return Card(
         child: InkWell(
           onTap: ()  => _goView(e),
           child: Container(
             margin: EdgeInsets.all(1),
             padding: EdgeInsets.all(1),
             child:SingleChildScrollView(
               child: Flexible(
                 child: Row(
                   mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.circular(50),
                        child: FadeInImage(
                         placeholder: AssetImage(e.image),
                          image: NetworkImage(e.image),
                          width: 100,
                          height:100,
                          fit: BoxFit.cover,
                          ),
                     ),
                     Column(
                       children:[ 
                         Text(
                         e.name,
                         style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.indigo,
                         ),
                       ),
                       ]
                     ),
                     Icon(Icons.redo_outlined)
                  ],
                 ),
               ),
             ),
             ),
         ),
       );

     }).toList(),
   );
 }

  void _removeFilter() {
      setState(() {
      _isFiltered = false;
    });
    _getElephants();
  }

  void _showFilter() {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text('Filtrar Elefantes'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Digite un nombre a filtrar'),
              SizedBox(height: 10,),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Ingrese un nombre',
                  labelText: 'Buscar',
                  suffixIcon: Icon(Icons.search)
                ),
                onChanged: (value) {
                  _search = value;
                },
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: Text('Cancelar')
            ),
            TextButton(
              onPressed: () => _filter(), 
              child: Text('Filtrar')
            ),
          ],
        );
      });
  }

  void _filter() {
     if (_search.isEmpty) {
      return;
    }

    List<elephant> filteredList = [];
    for (var elephant in _elephants) {
      if (elephant.name.toLowerCase().contains(_search.toLowerCase())) {
        filteredList.add(elephant);
      }
    }

    setState(() {
      _elephants = filteredList;
      _isFiltered = true;
    });

    Navigator.of(context).pop();
  }

  _goView(elephant e) async {

        String? result = await Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ElephantsScreen(todo: e,),
      )
    );
    if (result == 'yes') {
      _getElephants();
    }
    
  } 
  }
