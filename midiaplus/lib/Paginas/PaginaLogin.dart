import 'dart:convert';

import 'package:flutter/material.dart';

import 'PaginaCadastro.dart';
import 'PaginaPrincipal.dart';
import 'package:http/http.dart' as http;
import 'botao.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _toggleVisibility = true;

  var usernametxt = new TextEditingController();
  var senhatxt = new TextEditingController();

  var dados;
  var seguro = true;

  String _username;
  String _senha;

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
          errorMessage = "O nome é requerido";
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
          errorMessage = "O nome é requerido";
        }

        return errorMessage;
      },
    );
  }

  messagem(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Cadastro Realizado com Sucesso"),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );


  }

  @override
  Widget build(BuildContext context) {
    void MensagemDadosIncorretos() {
      var alert = new AlertDialog(
        title: new Text("Dados Incorretos"),
        content: new Text(
            "Usuário ou Senha incorretos"),
      );
      showDialog(builder: (context) => alert, context: context);
    }

    Future<String> Login(String username, String senha) async {
      var response = await http.get(
          Uri.parse(
              "http://192.168.178.1/flutter/login.php?username=${username}&senha=${senha}"),
          headers: {"Accept": "application/json"});
      print(response.body);
      setState(() {
        var convertDataToJson = json.decode(response.body);
        dados = convertDataToJson['result'];
        print(dados['username']);
      });

    }
    VerificarDados(String username, String senha) {
      if (dados[0]['username'] == username && dados[0]['senha'] == senha) {

        var route = new MaterialPageRoute(
          builder: (BuildContext context) =>
          new PaginaPrincipal(),
        );
        Navigator.of(context).push(route);
      } else {
        MensagemDadosIncorretos();
      }

    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(

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
                        _usernametxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _senhatxt(),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 20.0,
                ),

                GestureDetector(
                    onTap: () {
                      Login (usernametxt.text, senhatxt.text);
                      VerificarDados(usernametxt.text, senhatxt.text);

                    },
                    child: Button(
                      btnText: "Login",


                    )
                ),
                SizedBox(
                  height: 10.0,
                ),



                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Não possui cadastro?",
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
                                    CadastroPage()));
                      },
                      child: Text(
                        "Cadastrar",
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

