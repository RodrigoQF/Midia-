import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

class CadastroSerie extends StatefulWidget {
  @override
  _CadastroSerieState createState() => _CadastroSerieState();
}

class _CadastroSerieState extends State<CadastroSerie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Cadastro de Serie"),
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
                    labelText: "Titulo da Serie",
                    hintText: 'Titulo',
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                    hintText: 'Diretor da Serie',
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
                    hintText: 'Elenco da Serie',
                    labelText: "Eleco",
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

              TextFormField(

                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Rock Salt"),
                decoration: InputDecoration(
                    hintText: 'Numero de Temporadas',
                    labelText: "NumeroTemp",
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
                    "Cadastrar Serie",
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
