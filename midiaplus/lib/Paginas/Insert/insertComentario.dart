import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';
import 'package:midiaplus/Paginas/SideBar/comentarios.dart';

import '../PaginaLogin.dart';
import 'package:http/http.dart' as http;

import '../botao.dart';

class InserirComentario extends StatefulWidget {
  @override
  _InserirComentarioState createState() => _InserirComentarioState();
}

class _InserirComentarioState extends State<InserirComentario> {
  bool _toggleVisibility = true;

  String _titulo;
  String _comentario;
  String _avalicao;


  var titulotxt = new TextEditingController();
  var comentariotxt = new TextEditingController();
  var avalicaotxt = new TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _titulomidiatxt() {
    return TextFormField(
      controller: titulotxt,
      decoration: InputDecoration(
        hintText: "Titulo da Midia",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String titulo) {
        _titulo = titulo.trim();
      },
      validator: (String titulo) {
        String errorMessage;
        if (titulo.isEmpty) {
          errorMessage = "O nome é requerido";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        return errorMessage;
      },
    );
  }

  Widget _comentariotxt() {
    return TextFormField(
      controller: comentariotxt,
      decoration: InputDecoration(
        hintText: "Adicione seu comentario",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String comentario) {
        _comentario = comentario.trim();
      },
      validator: (String comentario) {
        String errorMessage;
        if (comentario.isEmpty) {
          errorMessage = "O comentario é necessario";
        }
        return errorMessage;
      },
    );
  }

  Widget _avalicaotxt() {
    return TextFormField(
      controller: avalicaotxt,
      decoration: InputDecoration(
        hintText: "Avaliacao de 1-5",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String avaliacao) {
        _avalicao = avaliacao.trim();
      },
      validator: (String senha) {
        String errorMessage;
        if (senha.isEmpty) {
          errorMessage = "A avaliacao é requirida";
        }
        return errorMessage;
      },
    );
  }

  void _inserirDados() async {
    final response = await http.post(
        Uri.parse("http://midiaplus.6te.net/MidiaPlustesdsa/inserircomentario.php"),
        body: {
          "titulo": titulotxt.text,
          "comentario": comentariotxt.text,
          "avaliacao": avalicaotxt.text,
        });
    final map = json.decode(response.body);
    final res = map["message"];
    messagem(res);
  }

  messagem(res){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(res),
      ),
    );

    if(res == 'Inserido com Sucesso'){
      titulotxt.text = "";
      comentariotxt.text = "";
      avalicaotxt.text = "";
      Navigator.push(

        context,
        MaterialPageRoute(builder: (context) => PaginaPrincipal()),
      );
    }
    if(res == 'Preencha os Dados'){

    }



  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/imagens/logo.png"),
                  height: 120.0,
                  width: 120.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _titulomidiatxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _comentariotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _avalicaotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 20.0,
                ),

                Divider(
                  height: 20.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 10.0),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ComentariosPage()));
                        },
                        child: Button(
                          btnText: "Inserir Comentarios",


                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }

}

