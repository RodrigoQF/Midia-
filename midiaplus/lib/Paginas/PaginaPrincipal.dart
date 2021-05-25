import 'package:flutter/material.dart';
import 'package:midiaplus/Paginas/CardFilme.dart';
import 'package:midiaplus/Paginas/CardLivro.dart';
import 'package:midiaplus/Paginas/CardSerie.dart';


class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xFF280031),
          appBar: AppBar(
            backgroundColor: Colors.deepPurpleAccent,
            bottom: TabBar(

              tabs: [

                Tab(text:"Filme",),
              Tab(text:"Serie",),
            Tab(text:"Livro",)
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              CardFilme(),
              CardSerie(),
              CardLivro(),
            ],
          ),
        ),
      ),
    );
  }
}