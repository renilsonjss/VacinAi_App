import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/screens/login_form.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _getHeader(),
            const SizedBox(height: 10),
            _perfilNome("João da Silva"),
            const SizedBox(height: 14),
            _heading("Dados pessoais"),
            const SizedBox(height: 6),
            _dadosPessoais(),
            const SizedBox(height: 10),
            _heading("Agendamento(s)"),
            const SizedBox(height: 6),
            _agendamento(),
            const SizedBox(height: 10),
            sairButton()
          ],
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _perfilNome(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Center(
        child: Text(
          name,
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      child: Text(
        heading,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _dadosPessoais() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.email),
              title: Text("123.456.789-00"),
            ),
            Divider(height: 4),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("joao@gmail.com"),
            ),
            Divider(height: 4),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("(82) 9 9123 4567"),
            ),
            Divider(height: 4),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Rua das Flores Nº 25"),
            )
          ],
        ),
      ),
    );
  }

  Widget _agendamento() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("25/02/2022, 14:00h, Posto de Saúde Santa Luzia"),
            ),
          ],
        ),
      ),
    );
  }

  Widget sairButton() {
    return TextButton(
      child: const Text(
        'Sair',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginForm()));
      },
    );
  }
}
