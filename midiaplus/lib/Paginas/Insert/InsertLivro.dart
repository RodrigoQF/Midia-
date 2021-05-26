import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midiaplus/Paginas/CardLivro.dart';
import '../botao.dart';

import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

class CadastroLivro extends StatefulWidget {
  @override
  _CadastroLivroState createState() => _CadastroLivroState();
}

class _CadastroLivroState extends State<CadastroLivro> {


  bool _toggleVisibility = true;

  String _titulo;
  String _autor;
  String _editora;
  String _pais;
  String _ano_lancamento;
  String _imagem;

  var titulotxt = new TextEditingController();
  var autortxt = new TextEditingController();
  var editoratxt = new TextEditingController();
  var paistxt = new TextEditingController();
  var ano_lancamentotxt = new TextEditingController();
  var imagemtxt = new TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _titulotxt() {
    return TextFormField(
      controller: titulotxt,
      decoration: InputDecoration(
        hintText: "Titulo do Livro",
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
          errorMessage = "O titulo é requerido";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        return errorMessage;
      },
    );
  }

  Widget _autortxt() {
    return TextFormField(
      controller: autortxt,
      decoration: InputDecoration(
        hintText: "Autor do Livro",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String autor) {
        _autor = autor.trim();
      },
      validator: (String autor) {
        String errorMessage;
        if (autor.isEmpty) {
          errorMessage = "O nome do diretor é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _editoratxt() {
    return TextFormField(
      controller: editoratxt,
      decoration: InputDecoration(
        hintText: "Editora ",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String editora) {
        _editora = editora.trim();
      },
      validator: (String editora) {
        String errorMessage;
        if (editora.isEmpty) {
          errorMessage = "A editora é requerida";
        }
        return errorMessage;
      },
    );
  }

  Widget _paistxt() {
    return TextFormField(
      controller: paistxt,
      decoration: InputDecoration(
        hintText: "pais de lancamento",
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
        hintText: "ano de lancamento",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String ano_lancamento) {
        _ano_lancamento = ano_lancamento.trim();
      },
      validator: (String ano_lancamento) {
        String errorMessage;
        if (ano_lancamento.isEmpty) {
          errorMessage = "O ano de lancamento é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _imagemtxt() {
    return TextFormField(
      controller: imagemtxt,
      decoration: InputDecoration(
        hintText: "Imagem(.png)",
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



  void _inserirDados() async {
    final response = await http.post(
        Uri.parse("http://192.168.178.1/flutter/inserirlivro.php"),
        body: {
          "titulo": titulotxt.text,
          "autor": autortxt.text,
          "editora": editoratxt.text,
          "pais": paistxt.text,
          "ano_lancamento": ano_lancamentotxt.text,
          "imagem": imagemtxt.text,
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
      autortxt.text = "";
      editoratxt.text = "";
      paistxt.text = "";
      ano_lancamentotxt.text = "";
      imagemtxt.text = "";
      Navigator.push(

        context,
        MaterialPageRoute(builder: (context) => CardLivro()),
      );
    }
    if(res == 'Preencha os Dados'){

    }



  }



  @override
  Widget build(BuildContext context) {
    Future<String> VerificaTitulo(String titulo) async {
      var response = await http.get(
          Uri.parse(
              "http://192.168.178.1/flutter/inserirlivro.php?titulo=${titulo}"),
          headers: {"Accept": "application/json"});
      print(response.body);
      setState(() {
        var convertDataToJson = json.decode(response.body);
        dados = convertDataToJson['result'];
        print(dados['titulo']);
      });

    }
    VerificarDados(String titulo) {
      if (dados[0]['titulo'] == titulo) {

        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
          message(res);
        );
        Navigator.of(context).push(route);
      } 
    }

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
                        _titulotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _autortxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _editoratxt(),
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
                    VerificaTitulo();
                    VerificarDados();
                    _inserirDados();
                  },
                  child: Button(
                    btnText: "Inserir",


                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );


  }

}

