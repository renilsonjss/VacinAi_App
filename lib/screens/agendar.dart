import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/comm/get_login_cadastro_header.dart';
import 'package:vacinai_app_novo/comm/get_text_form_field.dart';

class Agendar extends StatefulWidget {
  @override
  _AgendarState createState() => _AgendarState();
}

class _AgendarState extends State<Agendar> {
  final _formKey = new GlobalKey<FormState>();

  final _conNome = TextEditingController();
  final _conCpf = TextEditingController();
  final _conEmail = TextEditingController();
  final _conSenha = TextEditingController();
  final _conCSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agendar vacinação'),
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getLoginCadastroHeader(
                    headerName: 'Agendar vacinação',
                    imagePath: 'assets/images/agendar.png',
                  ),
                  getTextFormField(
                    controller: _conNome,
                    hintName: 'Data',
                    icon: Icons.person,
                    inputType: TextInputType.name,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conCpf,
                    hintName: 'Horário',
                    icon: Icons.person_search,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conEmail,
                    hintName: 'Posto de saúde',
                    icon: Icons.mail,
                    inputType: TextInputType.emailAddress,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: TextButton(
                        child: const Text(
                          'Agendar',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {}),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
