import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardSerie extends StatefulWidget {
  @override
  _CardFilmeState createState() => _CardFilmeState();
}

class _CardFilmeState extends State<CardSerie> {

  var buscar;
  var dados;
  var titulo, numero_temp, imagem;

  _listarDados() async{
    final response = await http.get(Uri.parse("http://192.168.178.1/flutter/listarserie.php"));
    final map = json.decode(response.body);
    final itens = map ["result"];
    this.dados = itens;


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

              height: 230.0,
              width: 340.0,
              child: new ListView.builder(
                  itemCount: this.dados != null ? this.dados.length : 0,
                  itemBuilder: (context, i){
                    final item = this.dados[i];
                    print(item);

                    return new Container(
                      margin: EdgeInsets.only(bottom: 15, left: 60, top: 10),
                      child: Stack(
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/imagens/' + item['imagem'],

                            ),
                            fit: BoxFit.cover,
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
                            left: 10.0,
                            bottom: 10.0,
                            right: 10.0,
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
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          item["numero_temp"],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
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
