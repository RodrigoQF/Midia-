import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

class CadastroLivro extends StatefulWidget {
  @override
  _CadastroLivroState createState() => _CadastroLivroState();
}

class _CadastroLivroState extends State<CadastroLivro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Cadastro de Livro"),
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
                    labelText: "Titulo do Livro",
                    hintText: 'TItulo',
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Autor do Livro',
                    labelText: "Autor",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(

                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Editora do Livro',
                    labelText: "Editora",
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
                    labelText: "Ano",
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
                    "Cadastrar Livro",
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