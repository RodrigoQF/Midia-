import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midiaplus/Paginas/Insert/insertComentario.dart';

import 'botao.dart';
class DadosFilme extends StatefulWidget {
  @override
  _DadosFilmeState createState() => _DadosFilmeState();
}

class _DadosFilmeState extends State<DadosFilme> {


  var buscar;
  var dados;
  var titulo, pais, imagem;
  var carregando = false;

  bool _toggleVisibility = true;

  String _titulo;
  String _diretor;
  String _elenco_principal;
  String _pais;
  String _ano_lancamento;
  String _imagem;

  var titulotxt = new TextEditingController();
  var diretortxt = new TextEditingController();
  var elenco_principaltxt = new TextEditingController();
  var paistxt = new TextEditingController();
  var ano_lancamentotxt = new TextEditingController();
  var imagemtxt = new TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  _listarDados() async{
    final response = await http.get(Uri.parse("http://midiaplus.6te.net/MidiaPlustesdsa/filmeselect.php"));
    final map = json.decode(response.body);
    final itens = map ["result"];
    this.dados = itens;

    setState(() {
      carregando = true;
      this.dados = itens;

    });


  }
  Widget _titulotxt() {
    return TextFormField(
      controller: titulotxt,
      decoration: InputDecoration(
        hintText: "Avatar",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String titulo) {
        _titulo = titulo.trim();
      },
    );
  }

  Widget _diretortxt() {
    return TextFormField(
      controller: diretortxt,
      decoration: InputDecoration(
        hintText: "James Cameron",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String diretor) {
        _diretor = diretor.trim();
      },
    );
  }

  Widget _elenco_principaltxt() {
    return TextFormField(
      controller: elenco_principaltxt,
      decoration: InputDecoration(
        hintText: "Zoë Saldaña",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String elenco_principal) {
        _elenco_principal = elenco_principal.trim();
      },
    );
  }

  Widget _paistxt() {
    return TextFormField(
      controller: paistxt,
      decoration: InputDecoration(
        hintText: "Estados Unidos",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String pais) {
        _pais = pais.trim();
      },
      validator: (String pais) {
        String errorMessage;
        if (pais.isEmpty) {
          errorMessage = "O pais de lancamento é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _ano_lancamentotxt() {
    return TextFormField(
      controller: ano_lancamentotxt,
      decoration: InputDecoration(

        hintText: "2009",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String ano_lancamento) {
        _ano_lancamento = ano_lancamento.trim();
      },
    );
  }

  Widget _imagemtxt() {
    return TextFormField(
      controller: imagemtxt,
      decoration: InputDecoration(
        hintText: "avatar01.png",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String imagem) {
        _imagem = imagem.trim();
      },
      validator: (String imagem) {
        String errorMessage;
        if (imagem.isEmpty) {
          errorMessage = "O link da imagem é requerido";
        }
        return errorMessage;
      },
    );
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
                  image: AssetImage("assets/imagens/avatar01.png"),
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
                        _titulotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _diretortxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _elenco_principaltxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _paistxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _ano_lancamentotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _imagemtxt(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InserirComentario()));
                    },
                    child: Button(
                      btnText: "Inserir Comentarios",


                    )
                ),


              ],
            ),
          ),
        ),
      ),
    );


  }

}



