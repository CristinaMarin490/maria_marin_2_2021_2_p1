import 'package:elephants_app/screens/elephant_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elephants'),
      ),
      body: _getBody(),
    );
  }
  _getBody() {
     return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
              child: FadeInImage(
              placeholder: AssetImage('assets/Elephant.png'),
              image: NetworkImage('assets/Elephant.png'),
              height: 300,
              fit: BoxFit.cover
            ),
          ),
          
           SizedBox(height: 30,),
          ListTile(
             leading: Icon(Icons.logout),
             title: const Text('Optener lista'),
             onTap: () {
               Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ElephantScreen()
                )
              );
             },
           ),
        ], 
      ),
    );
}


  /*_getBody() {
    return Container(
      child: Drawer(
child: ListView(
         padding: EdgeInsets.zero,
         children: <Widget>[
           DrawerHeader(
             child: Image(
               image: AssetImage('assets/Elephant.png'),
             )
           ),
           ListTile(
             leading: Icon(Icons.logout),
             title: const Text('Optener lista'),
             onTap: () {
               Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ElephantScreen()
                )
              );
             },
           ),
         ],
       ), 
      ),
    );
  }*/
}