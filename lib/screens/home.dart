import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/screens/perfil.dart';
import 'package:vacinai_app_novo/screens/agendar.dart';
import 'package:vacinai_app_novo/screens/map.dart';

import 'agendar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: pc,
          children: [
            Perfil(),
            Agendar(),
            Mapa(),
          ],
          onPageChanged: setPaginaAtual),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Agendar vacinação'),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_outlined), label: 'Locais de Vacinação'),
        ],
        onTap: (pagina) {
          pc.animateToPage(pagina,
              duration: const Duration(microseconds: 400), curve: Curves.ease);
        },
      ),
    );
  }
}
