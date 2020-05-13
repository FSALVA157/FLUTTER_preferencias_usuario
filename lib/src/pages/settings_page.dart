import 'package:flutter/material.dart';
import 'package:preferencias_usuario/src/share_prefs/preferencias_usuarios.dart';



import 'package:preferencias_usuario/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}



class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre = 'Pedro';
  TextEditingController textController;
  final prefs = new PreferenciasUsuario();
  

  _setSelectedRadio(int value) async{
     
    prefs.genero = value;
    _genero = value;
    setState(() {
      
    });
   }

  //  cargarPref() async{
  //    SharedPreferences prefs = await SharedPreferences.getInstance();
  //   _genero = prefs.getInt('genero');
  //   setState(() {
      
  //   });

   //}

  @override
  void initState() { 
    super.initState();
     _colorSecundario = prefs.colorSecundario;
     _genero = prefs.genero;
     textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = SettingsPage.routeName;
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: _colorSecundario? Colors.teal:Colors.blue,
        ),
        drawer: MenuWidget(),
         body: ListView(
           children: <Widget>[
             Container(
               padding: EdgeInsets.all(5.0),
               child: Text('Settings',style: TextStyle(fontSize: 45.0,fontWeight: FontWeight.bold),),
             ),
             Divider(),
             SwitchListTile(
               value: _colorSecundario,
               title: Text('Color Secundario'),
                onChanged: (value){
                    setState(() {
                      _colorSecundario = value;
                      prefs.colorSecundario = value;
                    });
                }
                ),
                
                RadioListTile(
                  value: 1,
                  title: Text('Masculino'),
                  groupValue: _genero,
                  onChanged: _setSelectedRadio,
                  ),

                  RadioListTile(
                  value: 2,
                  title: Text('Femenino'),
                  groupValue: _genero,
                  onChanged: _setSelectedRadio,
                  ),

                  Divider(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        helperText: 'Nombre de la Persona usando el teléfono'
                      ),
                      onChanged: (value){
                        prefs.nombreUsuario = value;
                      },
                    ),
                  )

           ],
         )
    );
  }
}