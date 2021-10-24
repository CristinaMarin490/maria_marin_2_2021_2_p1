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
    return Container(
      margin: EdgeInsets.all(30),   
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: FadeInImage(
               placeholder: AssetImage(todo.image),
               image: NetworkImage(todo.image),
                width: 300,
                height:300,
                fit: BoxFit.cover,
              ),
            ),

          SizedBox(height: 30,),

          Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(
               todo.name, 
             style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
          SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.affiliation, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
          SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.species, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
          SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.sex, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
           SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.fictional, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
           SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.dob, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
           SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.dod, 
             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
           SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.wikilink, 
             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
           SizedBox(height: 15,),
          Column(
            children:  [Text(
               todo.note, 
             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,
          ),
          ),
          ],),
          
          ],
         /* appBar: AppBar(
            title: Text(todo.index.toString()),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(todo.name),
              ),
            ],
            Row(
              children: [

              ],),
            

          ),*/
        ),
      ),
    );
  }
}
