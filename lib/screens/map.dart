import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/screens/home.dart';
import 'package:vacinai_app_novo/screens/get_map_widget.dart';

class Mapa extends StatefulWidget {
  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOCAIS PERTO DE VOCÊ!'),
        backgroundColor: Colors.indigo,
      ),
      body: Container(child: getMap()),
    );
  }
}
