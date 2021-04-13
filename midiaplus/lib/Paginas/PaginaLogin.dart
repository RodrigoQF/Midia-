import 'package:flutter/material.dart';

import 'PaginaCadastro.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Pagina de Login"),
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
                  labelText: "Login",
                  labelStyle: TextStyle (color: Colors.white, fontSize: 20)),
            ),
            TextFormField(
              autofocus: true,
              obscureText: true,
              keyboardType: TextInputType.text,
              style: new TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Rock Salt"),
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle (color: Colors.white, fontSize: 20)),
            ),
            ButtonTheme(

            height: 60.0,
              child: RaisedButton(
              onPressed: () => {},
              child: Text(
              "Entrar",
              style: TextStyle(color: Colors.white, fontSize: 20),
              )
            )
            ),
            Divider(),
            ButtonTheme(
              height: 60,
                child: RaisedButton(
                  onPressed: ()=>{
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroPage()),
                  ),

                  },
                  child: Text(
                    "Fazer Cadastro",
                    style: TextStyle(color: Colors.white, fontSize: 20),


                  ),
                ),
            ),

          ]
          ),
          ),
        ),

    );
  }
}
