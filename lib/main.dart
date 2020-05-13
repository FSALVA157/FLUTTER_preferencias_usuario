import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:preferencias_usuario/src/pages/settings_page.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuarios.dart';
 
void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  PreferenciasUsuario prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
   PreferenciasUsuario prefs = new PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute:  prefs.ultimaPagina,
      routes:{
          HomePage.routeName : (BuildContext context) => HomePage(),
          SettingsPage.routeName : (BuildContext context) => SettingsPage()
      } ,

      
    );
  }
}