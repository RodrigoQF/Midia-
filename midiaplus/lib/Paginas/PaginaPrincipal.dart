import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  _PaginaPrincipalState createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  List<String> _tabs = ['Filmes', 'Series', 'Livros'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(


      length: _tabs.length, // This is the number of tabs.
      child: Scaffold(

        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(

          backgroundColor: Colors.deepPurple,
          title: const Text('MidiaPlus'),

          bottom: TabBar(


            labelColor: Colors.white,
            // These are the widgets to put in each tab in the tab bar.
            tabs: _tabs.map((String name) => Tab(text: name)).toList(),
          ),
        ),
        body: TabBarView(
          // These are the contents of the tab views, below the tabs.
          children: _tabs.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(


                // This Builder is needed to provide a BuildContext that is "inside"
                // the NestedScrollView, so that sliverOverlapAbsorberHandleFor() can
                // find the NestedScrollView.
                builder: (BuildContext context) {
                  return Center(
                    child: Text('Page $name'),
                  );
                },
              ),

            );
          }).toList(),
        ),

      ),
    );
  }



}