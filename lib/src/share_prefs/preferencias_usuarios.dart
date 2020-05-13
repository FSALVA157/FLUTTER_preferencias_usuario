import 'package:preferencias_usuario/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

SharedPreferences _prefs;

//patron singleton
static final PreferenciasUsuario  _instancia = new PreferenciasUsuario._internal();

PreferenciasUsuario._internal();

factory PreferenciasUsuario(){
  return PreferenciasUsuario._instancia;
}


initPrefs() async{

   _prefs = await SharedPreferences.getInstance();
}

//get y set de genero
get genero{
  return _prefs.getInt('genero')?? 1;
}

set genero(int value){
  _prefs.setInt('genero', value);
}

get colorSecundario{
  return _prefs.getBool('colorSecundario')?? false;
}

set colorSecundario(bool value){
  _prefs.setBool('colorSecundario', value);
}

get nombreUsuario {
  return _prefs.getString('nombreUsuario')?? '';
}

set nombreUsuario(String value){
  _prefs.setString('nombreUsuario', value);
}

get ultimaPagina{
  return _prefs.getString('ultimaPagina')?? HomePage.routeName;
}

set ultimaPagina(value){
  _prefs.setString('ultimaPagina', value);
}

//estas propiedades no se usan
// String _nombre;
// bool _colorSecundario;
// int _genero;


}