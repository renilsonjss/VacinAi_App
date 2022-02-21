import 'package:flutter/material.dart';
import 'package:vacinai_app_novo/Comm/get_login_cadastro_header.dart';
import 'package:vacinai_app_novo/Comm/get_text_form_field.dart';
import 'package:vacinai_app_novo/comm/com_helper.dart';
import 'package:vacinai_app_novo/database_handler/db_helper.dart';
import 'package:vacinai_app_novo/screens/cadastro_form.dart';
import 'package:vacinai_app_novo/screens/perfil.dart';

import 'home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conCpf = TextEditingController();
  final _conSenha = TextEditingController();

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() {
    String cpf = _conCpf.text;
    String senha = _conSenha.text;

    if (cpf.isEmpty) {
      alertDialog(context, 'Por favor, informe o CPF');
    } else if (senha.isEmpty) {
      alertDialog(context, 'Por favor, informe a senha');
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getLoginCadastroHeader(
                  headerName: 'Faça seu login',
                  imagePath: 'assets/images/login.png',
                ),
                getTextFormField(
                  controller: _conCpf,
                  hintName: 'CPF',
                  icon: Icons.person_search,
                ),
                const SizedBox(height: 5.0),
                getTextFormField(
                  controller: _conSenha,
                  hintName: 'Senha',
                  icon: Icons.lock,
                  isObscureText: true,
                ),
                Container(
                  margin: const EdgeInsets.all(30.0),
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: TextButton(
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Home()));
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem uma conta? '),
                      TextButton(
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => CadastroForm()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
