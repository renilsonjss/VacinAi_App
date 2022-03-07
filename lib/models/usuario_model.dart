class UsuarioModel {
  late String nome_usuario;
  late String cpf_usuario;
  late String email_usuario;
  late String senha_usuario;

  UsuarioModel(this.nome_usuario, this.cpf_usuario, this.email_usuario,
      this.senha_usuario);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'nome_usuario': nome_usuario,
      'cpf_usuario': cpf_usuario,
      'email_usuario': email_usuario,
      'senha_usuario': senha_usuario
    };
    return map;
  }

  UsuarioModel.fromMap(Map<String, dynamic> map) {
    nome_usuario = map['nome_usuario'];
    cpf_usuario = map['cpf_usuario'];
    email_usuario = map['email_usuario'];
    senha_usuario = map['senha_usuario'];
  }
}
