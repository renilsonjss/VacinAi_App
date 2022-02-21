import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'dart:async';

import 'package:vacinai_app_novo/models/usuario_model.dart';

class DbHelper {
  static Database? _db;

  static const String DB_Name = 'vacinai.db';
  static const String Tabela_Usuario = 'usuario';
  static const int Version = 1;

  static const String C_Nome = 'nome_usuario';
  static const String C_Cpf = 'cpf_usuario';
  static const String C_Email = 'email_usuario';
  static const String C_Senha = 'senha_usuario';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: Version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute(
        "CREATE TABLE $Tabela_Usuario ($C_Nome TEXT, $C_Cpf TEXT, $C_Email TEXT, $C_Senha TEXT, PRIMARY KEY ($C_Cpf))");
  }

  Future<UsuarioModel> saveData(UsuarioModel usuario) async {
    var dbClient = await db;
    usuario.nome_usuario =
        (await dbClient!.insert(Tabela_Usuario, usuario.toMap())) as String;
    return usuario;
  }

  Future<UsuarioModel?> getLoginUsuario(String cpf, String senha) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery(
        "SELECT * FROM $Tabela_Usuario WHERE $C_Cpf = '$cpf' AND $C_Senha = '$senha'");
    if (res.length > 0) {
      return UsuarioModel.fromMap(res.first);
    }

    return null;
  }
}
