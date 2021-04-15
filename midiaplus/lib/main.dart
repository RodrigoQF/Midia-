import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaCadastro.dart';

import 'Paginas/PaginaLogin.dart';
import 'package:http/http.dart' as http;



void main () => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Midia+',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: LoginPage(),

    );

  }

}


