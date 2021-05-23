import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

class CadastroFilme extends StatefulWidget {
  @override
  _CadastroFilmeState createState() => _CadastroFilmeState();
}

class _CadastroFilmeState extends State<CadastroFilme> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Inserir um Filme"),
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
                    labelText: "Titulo do Filme",
                    hintText: 'Titulo',
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Diretor do Filme',
                    labelText: "Diretor",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(

                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Elenco do Filme',
                    labelText: "Elenco",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.datetime,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Pais de Lançamento',
                    labelText: "Pais",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Ano de Lançamento',
                    labelText: "Cidade",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Color(0xFF947bd3),
                  onPressed: () => {
                    //senddata(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaginaPrincipal()),
                    ),
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Cadastro Realizado com Sucesso"),
                      ),
                    ),
                  },
                  child: Text(
                    "Cadastrar Filme",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            ],
          ),

        ),
      ),

    );
  }
}
