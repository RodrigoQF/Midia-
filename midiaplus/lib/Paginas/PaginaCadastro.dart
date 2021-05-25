import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'PaginaLogin.dart';
import 'botao.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}


class _CadastroPageState extends State<CadastroPage> {


  bool _toggleVisibility = true;

  String _nome_completo;
  String _username;
  String _senha;
  String _data_nascimento;
  String _cidade;
  String _estado;

  var nome_completotxt = new TextEditingController();
  var usernametxt = new TextEditingController();
  var senhatxt = new TextEditingController();
  var data_nascimentotxt = new TextEditingController();
  var cidadetxt = new TextEditingController();
  var estadotxt = new TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _nometxt() {
    return TextFormField(
      controller: nome_completotxt,
      decoration: InputDecoration(
        hintText: "nome_completo",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String nome_completo) {
        _nome_completo = nome_completo.trim();
      },
      validator: (String nome_completo) {
        String errorMessage;
        if (nome_completo.isEmpty) {
          errorMessage = "O nome é requerido";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        return errorMessage;
      },
    );
  }

  Widget _usernametxt() {
    return TextFormField(
      controller: usernametxt,
      decoration: InputDecoration(
        hintText: "username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String username) {
        _username = username.trim();
      },
      validator: (String username) {
        String errorMessage;
        if (username.isEmpty) {
          errorMessage = "O Username é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _senhatxt() {
    return TextFormField(
      controller: senhatxt,
      decoration: InputDecoration(
        hintText: "senha",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String senha) {
        _senha = senha.trim();
      },
      validator: (String senha) {
        String errorMessage;
        if (senha.isEmpty) {
          errorMessage = "A senha é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget __data_nascimentotxt() {
    return TextFormField(
      controller: data_nascimentotxt,
      decoration: InputDecoration(
        hintText: "data nascimento",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String data_nascimento) {
        _data_nascimento = data_nascimento.trim();
      },
      validator: (String data_nascimento) {
        String errorMessage;
        if (data_nascimento.isEmpty) {
          errorMessage = "A Data é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _cidadetxt() {
    return TextFormField(
      controller: cidadetxt,
      decoration: InputDecoration(
        hintText: "cidade",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String cidade) {
        _cidade = cidade.trim();
      },
      validator: (String cidade) {
        String errorMessage;
        if (cidade.isEmpty) {
          errorMessage = "A cidade é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _estadotxt() {
    return TextFormField(
      controller: estadotxt,
      decoration: InputDecoration(
        hintText: "estado",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String estado) {
        _estado = estado.trim();
      },
      validator: (String estado) {
        String errorMessage;
        if (estado.isEmpty) {
          errorMessage = "O estado é requerido";
        }
        return errorMessage;
      },
    );
  }

   /*void _inserir(){
    var url = "http://192.168.178.1/flutter/inserirusuario.php";
    http.post(url, body:{
      "nome_completo" : nome_completotxt.text,
      "username" : usernametxt.text,
      "senha" : senhatxt.text,
      "data_nascimento" : data_nascimentotxt.text,
      "cidade" : cidadetxt.text,
      "estado" : estadotxt.text,


    });


  }

    */



    void _inserirDados() async {
      final response = await http.post(
          Uri.parse("http://192.168.178.1/flutter/inserirusuario.php"),
          body: {
            "nome_completo": nome_completotxt.text,
            "username": usernametxt.text,
            "senha": senhatxt.text,
            "data_nascimento": data_nascimentotxt.text,
            "cidade": cidadetxt.text,
            "estado": estadotxt.text,
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
        nome_completotxt.text = "";
        usernametxt.text = "";
        senhatxt.text = "";
        data_nascimentotxt.text = "";
        cidadetxt.text = "";
        estadotxt.text = "";
        Navigator.push(

          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
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
                            _nometxt(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _usernametxt(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _senhatxt(),
                            SizedBox(
                              height: 10.0,
                            ),
                            __data_nascimentotxt(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _cidadetxt(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _estadotxt(),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 20.0,
                    ),

                    GestureDetector(
                        onTap: () {
                          _inserirDados();
                        },
                        child: Button(
                          btnText: "Inserir",


                        )
                    ),
                    Divider(
                      height: 20.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Já possui Cadastro?",
                          style: TextStyle(
                              color: Color(0xFFBDC2CB),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginPage()));
                          },
                          child: Text(
                            "Logar",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
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








