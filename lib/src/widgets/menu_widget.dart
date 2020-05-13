import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';

class MenuWidget extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
  
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/menu-img.jpg'),
                  fit: BoxFit.cover
                  ),
              ),
              child: Container()
              ),
              ListTile(
                onTap: ()=>Navigator.pushReplacementNamed(context, HomePage.routeName),
                leading: Icon(Icons.home, color: Colors.blue,),
                title: Text('Home'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon( Icons.party_mode, color: Colors.blue ),
                title: Text('Party Mode'),
              ),
              ListTile(
                onTap: (){},
                leading: Icon( Icons.people, color: Colors.blue ),
            title: Text('People'),
              ),
              ListTile(
                onTap: ()=>Navigator.pushReplacementNamed(context, SettingsPage.routeName),
                leading: Icon(Icons.settings, color: Colors.blue,),
                title: Text('Settings'),
              ),

        ],
      ),
    );
  }
}