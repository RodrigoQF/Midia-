import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

import '../botao.dart';

class ComentariosPage extends StatefulWidget {
  @override
  _ComentariosPageState createState() => _ComentariosPageState();
}

class _ComentariosPageState extends State<ComentariosPage> {

  var buscar;
  var dados;
  var titulo, pais, imagem;
  var carregando = false;

  _listarDados() async{
    final response = await http.get(Uri.parse("http://midiaplus.6te.net/MidiaPlustesdsa/listarcomentario.php"));
    final map = json.decode(response.body);
    final itens = map ["result"];
    this.dados = itens;

    setState(() {
      carregando = true;
      this.dados = itens;

    });


  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _listarDados();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(

              height: 600.0,
              width: 400.0,
              child: !carregando
                  ? new LinearProgressIndicator()
                  : new ListView.builder(
                  itemCount: this.dados != null ? this.dados.length : 0,
                  itemBuilder: (context, i){
                    final item = this.dados[i];
                    print(item);

                    return new Container(
                      margin: EdgeInsets.only(bottom: 15, left: 20, top: 10),
                      child: Stack(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      //builder: (BuildContext context) =>
                                         // print(carregando);
                                  ));
                            },
                            child: Image(

                              image: AssetImage('assets/imagens/black.png'),
                              fit: BoxFit.cover,
                            ),
                          ),


                          Positioned(
                            left: 0.0,
                            bottom: 0.0,
                            width: 240.0,
                            height: 50.0,
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [Colors.black, Colors.black12])),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            bottom: 50.0,
                            right: 50.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item['titulo'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      item['comentario'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      item['avaliacao'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),

                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  PaginaPrincipal()));
                                    },
                                    child: Button(
                                      btnText: "Pagina Inicial",


                                    )
                                ),
                              ],
                            ),
                          ),


                        ],
                      ),
                    );

                  }
              )

          )
        ],
      ),
    );
  }

}