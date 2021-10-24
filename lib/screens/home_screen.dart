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
             // _showLogo(),
             // SizedBox(height: 20,),
          
           SizedBox(height: 30,),
          ListTile(
             leading: Icon(Icons.post_add_outlined),
             title: const Text('Ver lisado de elefantes')
             ,
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
  Widget _showLogo() {
      return Image(
        image: AssetImage('assets/noimage.png'),
        width: 150,
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