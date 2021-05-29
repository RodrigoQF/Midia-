import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaCadastro.dart';
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';
import 'package:midiaplus/Paginas/SideBar/comentarios.dart';
import 'package:midiaplus/Paginas/SideBar/usuarios.dart';

import 'Paginas/PaginaLogin.dart';
import 'package:http/http.dart' as http;



void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Midia+',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: ComentariosPage(),

    );

  }

}


