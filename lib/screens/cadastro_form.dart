import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:vacinai_app_novo/Comm/get_login_cadastro_header.dart';
import 'package:vacinai_app_novo/Comm/get_text_form_field.dart';
import 'package:vacinai_app_novo/comm/com_helper.dart';
import 'package:vacinai_app_novo/database_handler/db_helper.dart';
import 'package:vacinai_app_novo/models/usuario_model.dart';
import 'package:vacinai_app_novo/screens/login_form.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = new GlobalKey<FormState>();

  final _conNome = TextEditingController();
  final _conCpf = TextEditingController();
  final _conEmail = TextEditingController();
  final _conSenha = TextEditingController();
  final _conCSenha = TextEditingController();

  var dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  cadastrar() {
    String nome = _conNome.text;
    String cpf = _conCpf.text;
    String email = _conEmail.text;
    String senha = _conSenha.text;
    String csenha = _conCSenha.text;

    if (_formKey.currentState!.validate()) {
      if (senha != csenha) {
        alertDialog(context, 'As senhas não correspondem');
      } else {
        _formKey.currentState!.save();

        UsuarioModel uModel = UsuarioModel(nome, cpf, email, senha);
        dbHelper.saveData(uModel).then((usuarioData) {
          alertDialog(context, 'Usuário cadastrado com sucesso!');
        }).catchError((error) {
          print(error);
          alertDialog(context, 'Erro: falha ao cadastrar');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                    headerName: 'Cadastre-se',
                    imagePath: 'assets/images/cadastro.png',
                  ),
                  getTextFormField(
                    controller: _conNome,
                    hintName: 'Nome completo',
                    icon: Icons.person,
                    inputType: TextInputType.name,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conCpf,
                    hintName: 'CPF',
                    icon: Icons.person_search,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conEmail,
                    hintName: 'Email',
                    icon: Icons.mail,
                    inputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conSenha,
                    hintName: 'Senha',
                    icon: Icons.lock,
                    isObscureText: true,
                  ),
                  const SizedBox(height: 5.0),
                  getTextFormField(
                    controller: _conCSenha,
                    hintName: 'Confirmar senha',
                    icon: Icons.lock_outline,
                    isObscureText: true,
                  ),
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(10.0),
                    width: double.infinity,
                    child: TextButton(
                        child: const Text(
                          'Cadastrar-se',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: cadastrar),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Já tem uma conta? '),
                        TextButton(
                          child: const Text(
                            'Faça seu login',
                            style: TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => LoginForm()),
                                (Route<dynamic> route) => false);
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
      ),
    );
  }
}
