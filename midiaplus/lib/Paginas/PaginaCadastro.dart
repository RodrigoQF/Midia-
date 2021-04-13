import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Pagina de Cadastro"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  labelStyle: TextStyle (color: Colors.white)),
                ),
              Divider(),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.datetime,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Data de Nascimento",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    labelText: "Cidade",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Rock Salt"),
                decoration: InputDecoration(
                    labelText: "Estado",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text(
                    "Realizar Cadastrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),

                  ),
                  color: Colors.deepOrange,
                ),
              )
            ],
          ),

        ),
      ),

    );
  }
}
